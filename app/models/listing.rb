class Listing < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :title, :description, presence: true

  def self.search(word)
    if word
      self.where("title LIKE ?", "%#{word}%")
    else
      Listing.all
    end
  end

end
