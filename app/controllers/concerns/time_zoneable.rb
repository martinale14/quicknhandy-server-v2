module TimeZoneable
  extend ActiveSupport::Concern

  included do
    around_action :set_time_zone
  end

  private

  def set_time_zone(&action)
    return action.call if current_user&.time_zone.nil?

    Time.use_zone(current_user.time_zone, &action)
  end
end
