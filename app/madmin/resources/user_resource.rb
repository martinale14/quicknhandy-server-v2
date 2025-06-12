class UserResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :profile_picture
  attribute :suspended_indefinitely
  attribute :active
  attribute :email, index: true
  attribute :reset_password_token, form: false
  attribute :reset_password_token_sent_at, form: false
  attribute :first_name
  attribute :last_name
  attribute :name, form: false
  attribute :time_zone
  attribute :zip_code
  attribute :birthday
  attribute :phone_number
  attribute :country_code
  attribute :suspended_until
  attribute :suspention_message
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :password, index: false, show: false, form: false
  attribute :password_confirmation, index: false, show: false, form: false
  attribute :temporary_password, index: false, form: false

  # Associations
  attribute :roles

  # Add scopes to easily filter records
  # scope :published

  # Add actions to the resource's show page
  # member_action do |record|
  #   link_to "Do Something", some_path
  # end

  # Customize the display name of records in the admin area.
  def self.display_name(record) = record.email

  # Customize the default sort column and direction.
  # def self.default_sort_column = "created_at"
  #
  # def self.default_sort_direction = "desc"
end
