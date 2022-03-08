class User < ApplicationRecord
  has_many :posts
  has_many :comments

  has_secure_password

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  validates :password,
            presence: true,
            length: { minimum: 8 }

  def username
    email.sub(/@[^@\s]+/, '')
  end
end
