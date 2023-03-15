class Product < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
>>>>>>>>> Temporary merge branch 2
end
