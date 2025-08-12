Rails.application.routes.draw do
  get "/articles", to: "articles#index", as: :articles
  get "/articles/new", to: "articles#new", as: :new_article
  post "/articles", to: "articles#create"
  get "/articles/:id", to: "articles#show", as: :article

  get "articles/:id/edit", to: "articles#edit", as: "edit_article"
  patch "articles/:id", to: "articles#update"

  delete "/articles/:id", to: "articles#destroy"

  # Login
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get "up" => "rails/health#show", as: :rails_health_check

  root "articles#index"
end
