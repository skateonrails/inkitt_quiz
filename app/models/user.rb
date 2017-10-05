class User < ApplicationRecord
  has_many :answers

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /.+@.+\..+/i }
  validates :fingerprint_hash, presence: true,
                               uniqueness: true

  scope :finished_quiz, -> { where(finished_quiz: true) }

  def unanswered_question
    return Question.order(:created_at).first if last_answer.blank?

    last_answer.question.next_question
  end

  private

  def last_answer
    answers.order(:created_at).last
  end
end
