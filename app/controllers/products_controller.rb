class ProductsController < ApplicationController
  def index
    products = Product.prep_for_react(Product.all)
    render inertia: "App", props: { products: products }
  end

  def show
    product = Product.find(params[:id]).props
    render inertia: "App", props: { products: [product] }
  end
end
