class ProductsController < ApplicationController
  def index
    @produtos = Product.all
    @array = organizar(@produtos)
    @relatorio_top = relatorio(@produtos).sort_by { |name, sales| sales }.reverse.first(5)
    @relatorio_down = relatorio(@produtos).sort_by { |name, sales| sales }.first(5)
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
  
  # Cria uma array com objetos da tabela de compras e vendas, organiza por data e retorna essa array.
  def organizar(produtos)
    array = []
    produtos.each do |produto|
      array.concat(produto.factories) 
      array.concat(produto.sales)
    end
    array.sort_by(&:created_at)
  end
  

  def relatorio(produtos)
    hash = {}
    produtos.each do |produto|
      hash[produto.name] = produto.sales.sum(:sale_quantity, :group => 'MONTH("created_at")') 
      #vendas_do_mes.each do |venda|
        #hash[produto.id] = venda.sum(:sale_quantity)
      #end
    end
   hash
  end

end
