class Message < ApplicationRecord
  belongs_to :conversation
  validates :message, presence: true
end
