class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :payment_method, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validates_inclusion_of :start_date,
                         in: Date.today..Date.civil(2050, 1, 1),
                         message: "Your booking has to be from today"
end
