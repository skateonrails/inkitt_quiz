class QuestionsController < ApplicationController
  def show
    @answer = question.answers.build(user: user)
    @previous_question = @question.previous_question
    @next_question = @question.next_question
  end

  private

  def question
    @question ||= Question.find(params[:id])
  end

  def user
    @user ||= User.find(session[:current_user_id])
  end
end
