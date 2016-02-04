require 'test_helper'

class FactoryTest < ActiveSupport::TestCase
  
  test "quantidade de compras deve existir" do
    compra = Factory.new
    assert_not compra.valid?
  end
  
  test "quantidade de compras deve ser um número inteiro" do
    compra = Factory.new(selling_quantity: 2.5 )
    assert_not compra.valid?
  end
  
  test "quantidade de compras deve ser um número inteiro maior que 0" do
    compra = Factory.new(selling_quantity: -2)
    assert_not compra.valid?
  end
end
