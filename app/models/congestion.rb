class Prototype < ApplicationRecord
  with_options presence: true do
  validates :ski_resort_id, numericality: { other_than: 0 }
  validates :waiting_id
  validates :image
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ski_resort
end