class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :congestion

  validates :content, presence: true
end
