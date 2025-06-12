class ServiceType < ApplicationRecord
  extend Mobility

  translates :title

  belongs_to :category, class_name: "Category"
  belongs_to :subcategory, class_name: "Category"
end
