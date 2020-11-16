class CartController < ApplicationController
  def create
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end
end
