class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
