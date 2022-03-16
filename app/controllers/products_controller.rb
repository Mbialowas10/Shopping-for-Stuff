class ProductsController < ApplicationController
  def index
    @products = Product.all


    #@visit_count = session[:visit_count]
  end

  def show
    @product = Product.find(params[:id])
  end
end
