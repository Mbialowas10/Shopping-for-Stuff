class CartController < ApplicationController

  def create
    logger.debug("Adding #{params[:product_id]} to cart.")
    id = params[:product_id].to_i
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)
    product = Product.find(id)
    flash[:notice] = "✚ #{product.name} added to cart."
    redirect_to root_path
  end

  def destroy
    #binding.pry
    logger.debug("Removing #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "− #{product.name} removed from cart"
    redirect_to root_path
  end

end
