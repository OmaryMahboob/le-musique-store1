class Review < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :content, rating:
end
