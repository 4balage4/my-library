Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "books", to: "books#index"
  get "books/new", to: "books#new"
  post "books", to: "books#create"
  get "books/:id", to: "books#show"

  # Defines the root path route ("/")
  # root "articles#index"
end
