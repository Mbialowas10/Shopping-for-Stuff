Rails.application.routes.draw do
  resources :products, only: %i[index show]
  resources :cart, only: %i[create destroy]
  root to: "products#index"
end
