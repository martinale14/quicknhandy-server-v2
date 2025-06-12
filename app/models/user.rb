class User < ApplicationRecord
  rolify

  include User::Authenticable
  include User::Sessionable

  has_many :addresses

  validates :email, :password, :first_name, :last_name,
            :time_zone, :zip_code, :birthday, :phone_number,
            :country_code, presence: true
  validates :email, uniqueness: true
end
