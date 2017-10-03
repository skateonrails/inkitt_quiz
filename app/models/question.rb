class Question < ApplicationRecord
  has_closure_tree

  has_many :alternatives, -> { order(position: :asc) }

  validates :title, presence: true, uniqueness: true

  def next_question
    children.first
  end

  def previous_question
    parent
  end
end
