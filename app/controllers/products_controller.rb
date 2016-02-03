class ProductsController < ApplicationController
  def index
    @produtos = Product.all
    @produto = Product.first
  end

  def new
    @produto = Product.new
  end
  
  def create
    @produto = Product.new(produtos_params)
    if @produto.save
      flash[:success] = "Nova categoria de produto!"
      redirect_to products_path
    else
      render :new
    end
  end
  
  
  private
  
  def produtos_params
    params.require(:product).permit(:name, :product_type)
  end
end
