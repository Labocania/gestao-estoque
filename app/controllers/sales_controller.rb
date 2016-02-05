class SalesController < ApplicationController
  def new
    @produto = Product.find(params[:product_id])
    @venda = @produto.sales.build
  end
  
  def create
    @produto = Product.find(params[:product_id])
    @venda = @produto.sales.build(vendas_params)
    if @venda.valid? & @produto.valid?
      @produto.inventory -= @venda.sale_quantity
      @venda.save 
      @produto.save
      flash[:success] = "Nova venda efetuada."
      redirect_to products_path
    else
      flash.now[:alert] = "Erro no processo de venda."
      render :new
    end
  end
  
  private
  
  def vendas_params
    params.require(:sale).permit(:sale_quantity)
  end
end
