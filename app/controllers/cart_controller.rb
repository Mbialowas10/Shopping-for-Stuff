class CartController < ApplicationController
  def create
    logger.debug("adding #{params[:id]} to cart.")
    id = params[:id].to_i
    # session[:shopping_cart] << id unless session[:shopping_cart].include?(id) # push the id on the array
    product = Product.find(id)
    if session[:shopping_cart].include?(id)
      flash[:notice] = "⊕ #{product.name} can't be added"
    elsif session[:shopping_cart] << id

      flash[:notice] = "⊕ #{product.name} has been added to cart..."
    end

    # flash[:notice] = "⊕ #{product.name} has been added to cart..."

    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "- #{product.name} removed from cart...."
    redirect_to root_path
  end
end
