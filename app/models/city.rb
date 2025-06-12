class City < ApplicationRecord
  belongs_to :country
  has_many :coverage_zones
end
