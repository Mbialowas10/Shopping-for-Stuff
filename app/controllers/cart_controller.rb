class CartController < ApplicationController

    # POST / cart
    # data is sent as form data (params)
    def create
      logger.debug("Adding #{params[:id]} to cart. ")
      id = params[:id].to_i
      unless session[:shopping_cart].include?(id)
        session[:shopping_cart] << id # push id onto the end of the cart array
        product = Product.find(id)

        flash[:notice] = "➕ #{product.name} added to cart."
        redirect_to root_path
      end

    end

    # DELETE /cart/:id
    def destroy
      logger.debug("***Trying to delete #{params[:id]} from cart. ")
      id = params[:id].to_i
      session[:shopping_cart].delete(id)
      product = Product.find(id)
      flash[:notice] = "➖ #{product.name} removed from cart."
      redirect_to root_path
    end

end
