module CurrentHelper
  def current_user
    Current.user
  end

  def current_session
    Current.session
  end
end
