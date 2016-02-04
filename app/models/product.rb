class Product < ActiveRecord::Base
  before_save :downcase_nome
  has_many :factories
  has_many :sales
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :product_type, inclusion: { in: %w(DZ UN KG) }
  validates :inventory, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  private
  
  def downcase_nome
      self.name= name.downcase
  end
end
