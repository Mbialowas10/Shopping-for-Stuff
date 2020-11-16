class ProductsController < ApplicationController
  def index
    render inertia: "App", props: { products: Product.all }
  end
end
