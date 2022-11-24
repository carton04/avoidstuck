class Prototype < ApplicationRecord
  with_options presence: true do
  validates :ski_resort_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :waiting
  validates :image
  end

  validates :price, numericality: { only_interger: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999 }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ski_resort
end