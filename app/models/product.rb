class Product < ApplicationRecord
  belongs_to :user

  validates :title, description:
  validates :price, uniqueness: true
end
