Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "books", to: "books#index"
  get "books/new", to: "books#new"
  post "books", to: "books#create"
  get "books/:id", to: "books#show", as: :book
  delete "books/:id", to: "books#destroy"
  get "books/:id/edit", to: "books#edit", as: :book_edit
  patch "books/:id", to: "books#update"


  get "listings", to: "listings#index"
  get "books/:id", to: "listings#new"
  post "books/:id", to: "listings#create"
  # Defines the root path route ("/")
  # root "articles#index"

  get "lists", to: "lists#index", as: :list
  get "lists", to: "lists#new"
  # get "lists/new", to: "lists#new"
  post "lists", to: "lists#create"
  get "lists/:id", to: "lists#show"


end
