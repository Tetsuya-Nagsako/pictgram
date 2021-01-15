class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 15}
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  validates :password, presence: true, length: { minimum: 8, maximum: 32}, format: { with: VALID_PASSWORD_REGEX, message:"は半角8~32文字英文字・数字それぞれ１文字以上含む必要があります"}

  has_secure_password
  
  has_many :topics, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments, dependent: :destroy
  
end