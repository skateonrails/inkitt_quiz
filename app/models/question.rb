class Question < ApplicationRecord
  has_closure_tree

  has_many :answers, -> { order(position: :asc) }

  validates :title, presence: true, uniqueness: true
end
