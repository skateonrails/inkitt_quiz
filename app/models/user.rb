class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /.+@.+\..+/i }
  validates :fingerprint_hash, presence: true,
                               uniqueness: { scope: :email }
end
