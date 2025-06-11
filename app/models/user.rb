class User < ApplicationRecord
  has_secure_password
  has_secure_password :temporary_password, validations: false
  rolify

  has_many :sessions
end
