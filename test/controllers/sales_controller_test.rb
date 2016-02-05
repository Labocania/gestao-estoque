require 'test_helper'

class SalesControllerTest < ActionController::TestCase

  test "deve mostrar um erro quando colocar informações erradas" do
    assert_no_difference('Sale.count') do
      post :create, product_id: 1, sale: { sale_quantity: 0 }
    end
    assert_template :new
    assert_equal "Erro no processo de venda.", flash[:alert]
  end
  
  test "deve redirecionar para products_path depois de vender um produto" do
    assert_difference('Sale.count') do
      post :create, product_id: 1, sale: { sale_quantity: 10 }
    end
    assert_redirected_to products_path
    assert_equal "Nova venda efetuada.", flash[:success]
  end
end
