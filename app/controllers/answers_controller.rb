class AnswersController < ProtectedController
  def create
    if answer.save
      redirect_to question_path(next_question) if next_question.present?
    else
      flash[:error] = 'Could not save answer'
      redirect_to question_path(question)
    end
  end

  private

  def answer
    @answer ||= user.answers.build(
      question: question, alternative_id: answer_attributes[:alternative_id]
    )
  end

  def question
    @question ||= Question.find(params[:question_id])
  end

  def next_question
    question.next_question
  end

  def answer_attributes
    params.require(:answer).permit(:alternative_id)
  end
end
