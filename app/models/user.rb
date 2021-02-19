class User < ApplicationRecord
    has_many :listings
    has_many :bids
    has_many :bids_on_my_listings, :through => :listings, :source => :bids
    has_many :reviews
    has_many :skills, -> {distinct}, through: :reviews
    has_many :participants
    has_many :conversations, through: :participants

    has_secure_password 
    validates :username, presence: true
    validates :username, uniqueness: true
end
