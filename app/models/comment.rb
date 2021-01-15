class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :comment, presence: true
  
  belongs_to :user
  belongs_to :topic
end