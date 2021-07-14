class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_many :favorites
  has_many :favorite_courses, through: :favorites, source: :course
  has_secure_password
end
