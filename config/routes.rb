Rails.application.routes.draw do
  get '/report', to: "reports#index"

  root "books#index"

  resources :books
end
