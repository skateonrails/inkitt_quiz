class UsersController < ApplicationController
  before_action :check_existent_user, only: :create

  def index
    logout_user
    @user = User.new
  end

  def create
    if new_user.save
      login_user(new_user)
      redirect_to question_path(new_user.unanswered_question)
    else
      flash[:error] = new_user.errors.full_messages.first
      redirect_to(root_path)
    end
  end

  private

  def new_user
    @user ||= User.new(user_attributes)
  end

  def user_attributes
    params.require(:user).permit(:email, :fingerprint_hash)
  end

  def check_existent_user
    return if existent_user.blank?

    login_user(existent_user)
    return finished_quiz_redirect if existent_user.finished_quiz
    unanswered_question_redirect
  end

  def existent_user
    @existent_user ||= User.where(email: user_attributes[:email]).or(
      User.where(fingerprint_hash: user_attributes[:fingerprint_hash])
    ).first
  end

  def finished_quiz_redirect
    flash[:notice] = 'You already finished the quiz. See the results.'
    redirect_to answers_path
  end

  def unanswered_question_redirect
    flash[:notice] = 'You have unanswered questions. Please, continue with the quiz.'
    redirect_to question_path(existent_user.unanswered_question)
  end
end
