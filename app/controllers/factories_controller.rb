class FactoriesController < ApplicationController
  def new
    @produto = Product.find(params[:product_id])
    @compra = @produto.factories.build
  end
  
  def create
    @produto = Product.find(params[:product_id])
    @compra = @produto.factories.build(compras_params)
    if @compra.valid? & @produto.valid?
       @produto.inventory += @compra.selling_quantity
       @produto.save
       @compra.save
      flash[:success] = "Nova compra efetuada."
      redirect_to products_path
    else
      flash.now[:alert] = "Erro no processo de compra."
      render :new
    end
  end
  
  def compras_params
    params.require(:factory).permit(:selling_quantity)
  end
end
