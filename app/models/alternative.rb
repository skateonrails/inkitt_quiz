class Alternative < ApplicationRecord
  belongs_to :question

  validates :title, presence: true, uniqueness: { scope: :question_id }
end
