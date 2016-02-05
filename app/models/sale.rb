class Sale < ActiveRecord::Base
  belongs_to :product
  validates :sale_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  scope :by_date, -> { order('created_at ASC, id ASC') }
end
