class FactoriesController < ApplicationController
  def new
    @produto = Product.find(params[:product_id])
    @compra = @produto.factories.build
  end
  
  def create
    @produto = Product.find(params[:product_id])
    @compra = @produto.factories.build(compras_params)
    @produto.inventory += @compra.selling_quantity
    if @compra.save & @produto.save
      flash[:success] = "Nova compra efetuada."
      redirect_to products_path
    else
      render :new
    end
  end
  
  def compras_params
    params.require(:factory).permit(:selling_quantity)
  end
end
