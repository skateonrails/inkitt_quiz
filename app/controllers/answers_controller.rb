class AnswersController < ProtectedController
  def create
    save_and_redirect
  end

  def update
    answer.alternative_id = alternative_id
    save_and_redirect
  end

  private

  def save_and_redirect
    if answer.save
      redirect_to question_path(next_question) if next_question.present?
    else
      flash[:error] = 'Could not save answer'
      redirect_to question_path(question)
    end
  end

  def answer
    @answer ||= find_answer || build_answer
  end

  def find_answer
    user.answers.where(id: params[:id]).first
  end

  def build_answer
    user.answers.build(
      question: question, alternative_id: alternative_id
    )
  end

  def question
    @question ||= Question.find(params[:question_id])
  end

  def next_question
    question.next_question
  end

  def alternative_id
    answer_attributes[:alternative_id]
  end

  def answer_attributes
    params.require(:answer).permit(:alternative_id)
  end
end
