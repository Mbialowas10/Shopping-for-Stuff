Rails.application.routes.draw do
  resources :products, only: %i[index show]
  root to: "products#index"

  resources :cart, only: [:create, :destroy]

  # /checkout/create something
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create" # sending the data off to stripe
    get "success", to: "checkout#success", as: "checkout_success" # recieving the data from stripe until successfull transaction
    get "cancel", to: "checkout#cancel", as: "checkout_cancel" # not receiving the data back from stripe
  end
end
