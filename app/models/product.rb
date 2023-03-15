class Product < ApplicationRecord
  belongs_to :user
  include PgSearch::Model
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
    using: {
        tsearch: { prefix: true } # <-- now `drum tru` will return something!

        }

  multisearchable against: [:title, :description]
end
