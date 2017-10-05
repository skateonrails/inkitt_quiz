class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :alternative

  validates_uniqueness_of :user, scope: :question_id
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :alternative_id, presence: true
end
