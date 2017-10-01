class Question < ApplicationRecord
  has_closure_tree

  validates :title, presence: true, uniqueness: true
end
