class Congestion < ApplicationRecord
  with_options presence: true do
  validates :ski_resort_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :waiting
  validates :latitude
  validates :longitude
  end

  validates :waiting, numericality: { only_interger: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999 }

  with_options numericality: true do
    validates :latitude
    validates :longitude
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ski_resort

  def solved_by?(user)
    solutions.where(user_id: user.id).exists?
  end
end