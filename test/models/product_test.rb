require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "não deve salvar nome com atributo vazio" do
    produto = Product.new(name: "", inventory: 0, product_type: "UN")
    assert_not produto.save
  end
  
  test "não deve deixar dois nomes iguais" do
    produto_1 = Product.new(name: "banana", inventory: 0, product_type: "UN")
    produto_2 = Product.new(name: "BANANA", inventory: 0, product_type: "DZ")
    produto_1.save
    assert_not produto_2.save
  end
  
  test "product_type tem que estar nas siglas determinadas" do
    produto = Product.new(name: "maça", inventory: 0, product_type: "BZ")
    assert_not produto.save
  end
  
  test "inventory deve ficar em 0" do
    produto = Product.new(name: "maça", product_type: "DZ")
    assert_equal 0, produto.inventory
  end
  
end
