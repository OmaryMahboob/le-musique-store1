class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :payment_method, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
