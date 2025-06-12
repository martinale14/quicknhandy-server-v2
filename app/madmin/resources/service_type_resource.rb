class ServiceTypeResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :icon, field: IconField, index: true
  attribute :title, field: SearchableJsonField
  attribute :request_count, form: false
  attribute :banner_image, field: ImageField

  # Associations
  attribute :category
  attribute :subcategory

  attribute :created_at, form: false
  attribute :updated_at, form: false
  # Add scopes to easily filter records
  # scope :published
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
