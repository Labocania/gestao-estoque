require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "deve redirecionar para products quando cria um novo produto" do
    get :new
    assert_response :success
    assert_difference('Product.count') do
      post :create, product: { name: "Pão", product_type: "UN" }
    end
    assert_redirected_to products_path
    assert_equal "Nova categoria de produto!", flash[:success]
  end

end
