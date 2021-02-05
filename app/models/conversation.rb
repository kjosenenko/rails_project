class Conversation < ApplicationRecord
    has_many :messages
    has_many :participants
    has_many :users, through: :participants

    accepts_nested_attributes_for :messages
    accepts_nested_attributes_for :participants
end
