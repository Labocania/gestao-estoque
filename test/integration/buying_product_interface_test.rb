require 'test_helper'

class BuyingProductInterfaceTest < ActionDispatch::IntegrationTest
  
  test "deve adicionar produto e depois poder comprar para o estoque" do
    get products_path
    assert_select "a[href=?]", new_product_path, count: 1
    post products_path, product: {name: "melancia", product_type: "KG"}
    redirect?
  end
end