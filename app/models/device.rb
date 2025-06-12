class Device < ApplicationRecord
  acts_as_mappable distance_field_name: :distance,
                   lat_column_name: :lat,
                   lng_column_name: :lon

  belongs_to :session

  validates :app_version, :app_build_number, :vendor_identifier, :lat, :lon, :push_token, presence: true
end
