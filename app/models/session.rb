class Session < ApplicationRecord
  belongs_to :user
  has_one :device, dependent: :destroy
  has_one :api_token, dependent: :destroy

  validates :user_id, presence: true

  accepts_nested_attributes_for :device
  accepts_nested_attributes_for :api_token
end
