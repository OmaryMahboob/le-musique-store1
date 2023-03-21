class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :payment_method, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validates_inclusion_of :start_date,
                         in: Date.today..Date.civil(2050, 1, 1),
                         message: "Your booking has to start from today"

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date.present? && start_date.present? && (end_date < start_date)
      errors.add(:end_date, "Your booking has to be at least for the same day")
    end
  end
end
