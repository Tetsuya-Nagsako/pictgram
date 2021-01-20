class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :takephoto, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: 'user'
  
  def favorite_all_count
	  self.favorites.count
  end
  
  def shot_at
    self.takephoto.strftime("%Y/%m/%d %H:%M")
  end
  
end