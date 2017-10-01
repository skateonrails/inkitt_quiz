class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true, uniqueness: true
end
