class User < ApplicationRecord
  has_many :answers

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /.+@.+\..+/i }
  validates :fingerprint_hash, presence: true,
                               uniqueness: { scope: :email }

  scope :finished_quiz, -> { where(finished_quiz: true) }
end
