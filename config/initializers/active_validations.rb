module ActiveModel
  module Validations
    def errors_sentence
      errors.full_messages.to_sentence
    end
  end
end
