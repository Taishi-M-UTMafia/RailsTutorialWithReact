class User < ApplicationRecord
  # callback
  before_save { self.email = email.downcase }

  # validation
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z\d\-]\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } # 大文字小文字を無視した一意性を担保
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end