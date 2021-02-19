class Message < ApplicationRecord
  belongs_to :conversation
  validates :message, presence: true

  scope :descending, -> {order(created_at: :desc)}
end
