class Review < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :comment, :skill, presence: true
end
