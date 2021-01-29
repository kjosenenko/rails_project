class Listing < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :title, :description, presence: true
end
