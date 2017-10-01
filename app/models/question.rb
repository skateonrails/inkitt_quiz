class Question < ApplicationRecord
  has_closure_tree

  has_many :alternatives, -> { order(position: :asc) }

  validates :title, presence: true, uniqueness: true
end
