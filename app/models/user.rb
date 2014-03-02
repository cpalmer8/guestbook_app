class User < ActiveRecord::Base
  validates :name, presence: true, length: { maxiumum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX }
end
