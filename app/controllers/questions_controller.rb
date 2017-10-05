class QuestionsController < ProtectedController
  def show
    @answer = question.answers.build(user: user)
    @previous_question = @question.previous_question
    @next_question = @question.next_question
  end

  private

  def question
    @question ||= Question.find(params[:id])
  end
end
