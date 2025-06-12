class Category < ApplicationRecord
  extend Mobility
  attr_writer :subcategories

  monetize :price_hour_cents
  translates :title, :description
  has_ancestry

  has_many :service_types, class_name: "ServiceType", foreign_key: :subcategory_id, dependent: :destroy
  has_many :category_service_types, class_name: "ServiceType", foreign_key: :category_id, dependent: :destroy

  scope :parents, -> { where(ancestry: nil) }
end
