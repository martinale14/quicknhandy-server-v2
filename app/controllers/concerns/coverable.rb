module Coverable
  extend ActiveSupport::Concern

  included do
    def validate_service!
      return unless validate_coverage(location).nil?

      render json: { code: :not_support, error: t("api.errors.not_coverage") },
             status: :unprocessable_content
    end

    def validate_direction!(address_loc)
      city = validate_coverage(address_loc)
      return city unless city.nil?

      render json: { code: :not_support, error: t("api.errors.not_coverage") },
             status: :unprocessable_content

      nil
    end
  end

  private

  def location
    @location ||= calculate_location
  end

  def calculate_location
    location = params.require(:device).permit(:lat, :lon)

    if location[:lat].nil? || location[:lon].nil?
      result = Geocoder.search(request.remote_ip).first.coordinates
      location[:lat] = result.first
      location[:lon] = result.last
    end

    location
  end

  def load_coverage_geojson
    file = File.read(Rails.root.join("config/coverage/coverage.geojson"))
    RGeo::GeoJSON.decode(file)
  end

  def point_inside_polygon?(point, polygon)
    factory = RGeo::Cartesian.factory
    rgeo_point = factory.point(point[:lon], point[:lat])

    polygon.contains?(rgeo_point)
  end

  def validate_coverage(location)
    geojson_data = load_coverage_geojson
    geojson_data.each do |feature|
      if point_inside_polygon?(location, feature.geometry)
        coverage_zone = CoverageZone.find_by(code: feature[:geo_id])

        return nil unless coverage_zone&.enabled
        return coverage_zone.city
      end
    end
    nil
  end
end
