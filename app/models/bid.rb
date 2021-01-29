class Bid < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  validates :amount, :message, presence: true
end
