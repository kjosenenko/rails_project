class User < ApplicationRecord
    has_many :listings
    has_many :bids
    has_secure_password 
    validates :username, presence: true
    validates :username, uniqueness: true
end
