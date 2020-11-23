Rails.application.routes.draw do
  resources :products, only: %i[index show]

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    get "success", to: "checkout#success", as: "checkout_sucess"
  end

  root to: "products#index"
end
