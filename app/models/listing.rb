class Listing < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :title, :description, presence: true

  scope :search, ->(string) {where("title LIKE ?", "%#{string}%") if string.present? }

end
