class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates_uniqueness_of :topic_id, scope: :user_id
end
