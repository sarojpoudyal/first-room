class User < ActiveRecord::Base

  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
          uniqueness: { case_sensitive: false },
          length: { maximum:105 },
          format: { with: VALID_EMAIL_REGEX }

  validates :mobile, presence:true,
          uniqueness: true,
          length: {minimum: 3, maximum:25 }
  has_secure_password
end
