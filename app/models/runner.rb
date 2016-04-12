class Runner < ActiveRecord::Base
  has_many :shoes
  has_many :likes
  has_many :runs, through: :shoes
  before_save { self.email = email.downcase }
  validates :runnername, presence: true, length: {minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, presence: true, length: {maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end