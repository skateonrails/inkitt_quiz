class QuestionsController < ProtectedController
  def show
    @answer = find_answer || build_answer
    @previous_question = @question.previous_question
    @next_question = @question.next_question
  end

  private

  def find_answer
    question.answers.where(user_id: user.id).first
  end

  def build_answer
    question.answers.build(user: user)
  end

  def question
    @question ||= Question.find(params[:id])
  end
end
