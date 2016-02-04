require 'test_helper'

class FactoriesControllerTest < ActionController::TestCase
  
  test "deve mostrar um erro quando colocar informações erradas" do
    assert_no_difference('Factory.count') do
      post :create, product_id: 1, factory: { selling_quantity: 0 }
    end
    assert_template :new
    assert_equal "Erro no processo de compra.", flash[:alert]
  end
  
  test "deve redirecionar para products_path depois de comprar um produto" do
    assert_difference('Factory.count') do
      post :create, product_id: 1, factory: { selling_quantity: 10 }
    end
    assert_redirected_to products_path
    assert_equal "Nova compra efetuada.", flash[:success]
  end

end
