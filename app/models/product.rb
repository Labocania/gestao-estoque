class Product < ActiveRecord::Base
  before_save :downcase_nome
  has_many :factories
  has_many :sales
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :product_type, inclusion: { in: %w(DZ UN KG) }
  
  private
  
  def downcase_nome
      self.name= name.downcase
  end
end
