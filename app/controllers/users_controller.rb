class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    unless new_user.save
      flash[:error] = new_user.errors.full_messages.first
      return redirect_to(root_path)
    end

    session[:current_user_id] = new_user.id
    redirect_to question_path(Question.order(:created_at).first)
  end

  private

  def user_attributes
    params.require(:user).permit(:email, :fingerprint_hash)
  end

  def new_user
    @user ||= User.new(user_attributes)
  end
end
