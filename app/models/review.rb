class Review < ApplicationRecord
  belongs_to :user_id
  belongs_to :order_id
end
