module User::Authenticable
  extend ActiveSupport::Concern

  class InvalidUserParams < StandardError; end

  included do
    has_secure_password
    has_secure_password :temporary_password, validations: false
  end

  class_methods do
    def authenticate!(email:, password:)
      user = User.find_by!(email:)

      unless user.authenticate(password)
        raise InvalidUserParams.new(I18n.t("api.errors.invalid_email_or_password"))
      end

      user
    rescue ActiveRecord::RecordNotFound
      raise InvalidUserParams.new(I18n.t("api.errors.invalid_email_or_password"))
    end
  end

end
