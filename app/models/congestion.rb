class Prototype < ApplicationRecord
  validates :ski_resort_id, presence: true
  validates :waiting_id, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end