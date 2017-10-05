class AnswersController < ProtectedController
  before_action :user_finished_quiz?, only: :index

  def index
    @questions = Question.includes(:alternatives)
                         .order(:created_at)
                         .all
    @grouped_answers = Answer.finished
                             .group(:question_id, :alternative_id)
                             .count
  end

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
      if next_question.present?
        redirect_to question_path(next_question)
      else
        finish_quiz_for_user
      end
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

  def finish_quiz_for_user
    user.finished_quiz = true
    user.save
    redirect_to answers_path
  end

  def answer_attributes
    params.require(:answer).permit(:alternative_id)
  end

  def user_finished_quiz?
    unless user.finished_quiz?
      flash[:error] = 'You did not finished the quiz'
      redirect_to root_path
    end
  end
end
