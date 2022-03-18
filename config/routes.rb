Rails.application.routes.draw do
  resources :products, only: %i[index show]
  root to: "products#index"

  # example: /checkout/success
  scope "checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
end
