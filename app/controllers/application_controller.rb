class ApplicationController < ActionController::Base
  before_action :initialize_session
  after_action :add_csrf_token

  inertia_share do
    {
      cart:         Product.find(session[:cart]),
      header_image: helpers.image_url("eye.jpg")
    }
  end

  private

  def add_csrf_token
    cookies["XSRF-TOKEN"] = form_authenticity_token
  end

  def initialize_session
    session[:cart] ||= [] # Empty cart is an empty array.
  end
end
