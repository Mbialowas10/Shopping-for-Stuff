Rails.application.routes.draw do
  resources :products, only: :index
  resources :cart, only: %i[create destroy]
  root to: "products#index"
end
