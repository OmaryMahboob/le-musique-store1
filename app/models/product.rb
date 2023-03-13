class Product < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

  validates :title, description:
  validates :price, uniqueness: true
=======
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
<<<<<<< HEAD
  validates :address, presence:true
>>>>>>> 6c3df3089f7a7fb2f7bb68e5ae86be6baadcc468
=======
  validates :address, presence: true
>>>>>>> e897f6caa7ee42a5c8f310c547ea8d44b9cff7a2
end
