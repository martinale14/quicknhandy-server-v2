class Session < ApplicationRecord
  belongs_to :user
  has_one :device
end
