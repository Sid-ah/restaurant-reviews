class User < ActiveRecord::Base
  validates :username, :email, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password
end
