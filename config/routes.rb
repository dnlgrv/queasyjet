Rails.application.routes.draw do
  root to: "flights#new"

  resources :airports
  resources :flights
end
