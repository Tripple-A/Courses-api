class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :favorites
  has_many :favorite_courses, through: :favorites, source: :course
end
