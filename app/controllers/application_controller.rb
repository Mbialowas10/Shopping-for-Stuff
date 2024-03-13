class ApplicationController < ActionController::Base

  before_action :initialize_session
  helper_method :cart

  private
  def initialize_session
    session[:shopping_cart] ||=  [] # empty array of product IDs
  end

  def cart
    # you can pass an array of id, and you'll get a collection of product information
    Product.find(session[:shopping_cart])
  end



end
