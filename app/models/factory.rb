class Factory < ActiveRecord::Base
  belongs_to :product
  validates :selling_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end