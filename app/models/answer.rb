class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :alternative

  validates_uniqueness_of :user, scope: :question_id
end
