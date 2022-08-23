Rails.application.routes.draw do
  root to: "flights#new"

  resources :flights
end
