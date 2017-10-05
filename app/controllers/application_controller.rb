class ApplicationController < ActionController::Base
  include ExceptionHandler
  protect_from_forgery with: :exception

  def login_user(user)
    session[:current_user_id] = user.id
  end

  def logout_user
    session[:current_user_id] = nil
  end
end
