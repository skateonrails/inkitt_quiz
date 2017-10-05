class ProtectedController < ApplicationController
  before_action :check_user_session

  private

  def check_user_session
    if session[:current_user_id].blank?
      flash[:error] = 'User not found'
      redirect_to root_path
    end
  end

  def user
    @user ||= User.find(session[:current_user_id])
  end
end
