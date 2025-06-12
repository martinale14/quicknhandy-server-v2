class CategoryResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :icon, field: ImageField, index: true
  attribute :title, field: SearchableJsonField
  attribute :description, field: SearchableJsonField
  attribute :price_hour_cents
  attribute :ancestry

  # Associations
  attribute :service_types
  attribute :category_service_types

  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Add scopes to easily filter records
  scope :parents

  # Add actions to the resource's show page
  # member_action do |record|
  #   link_to "Do Something", some_path
  # end

  # Customize the display name of records in the admin area.
  def self.display_name(record) = record.title

  # Customize the default sort column and direction.
  # def self.default_sort_column = "created_at"
  #
  # def self.default_sort_direction = "desc"
end
