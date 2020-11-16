class ApplicationController < ActionController::Base
  before_action :initialize_session
  def initialize_session
    session[:cart] ||= [] # Empty cart is an empty array.
  end

  helper_method :cart
  def cart
    Product.find(session[:cart])
  end
end
