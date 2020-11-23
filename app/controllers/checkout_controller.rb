class CheckoutController < ApplicationController
  def create
    @product = Product.find(params[:id])

    respond_to do |format|
      format.js # render create.js.erb
    end
  end

  def success; end

  def cancel; end
end
