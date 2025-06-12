class Address < ApplicationRecord
  acts_as_mappable distance_field_name: :distance,
                   lat_column_name: :lat,
                   lng_column_name: :lon

  belongs_to :city
  belongs_to :user, optional: true

  enum :tag, { home: 0, office: 1, other: 2 }, default: :other, validate: true

  validates :lat, :lon, :address, presence: true

  def to_stripe
    {
      city: city.name,
      country: city.country.name,
      line1: address,
      line2: nil,
      postal_code: user.zip_code,
      state: nil
    }
  end
end
