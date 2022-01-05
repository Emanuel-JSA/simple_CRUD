class User < ApplicationRecord
  before_save { self.email = email.downcase}

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum:3, maximum:25 }
  VALID_EMAIL = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true, uniqueness: { case_sensitive: false },  length: { maximum:105 }, format: { with: VALID_EMAIL }
  
  has_many :articles

  has_secure_password
end