class ApiToken < ApplicationRecord
  has_secure_token

  belongs_to :session

  validates :token, :expires_at, presence: true

  def expired?
    expires_at? && Time.current >= expires_at
  end

  private

  def self.generate_unique_secure_token(length: MINIMUM_TOKEN_LENGTH)
    loop do
      new_token = SecureRandom.hex(length)
      return new_token unless ApiToken.where(token: new_token).exists?
    end
  end
end
