Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :listings, only: [:new, :create, :delete]
    resources :comments, only: [:new, :create, :delete]
  end
  resources :lists do
    resources :listings, only: [:new, :create, :delete]
  end
  resources :listings

  # get "listings", to: "listings#index"
  # get "books/:id", to: "listings#new"
  # post "books/:id", to: "listings#create"
  # get "list/:id", to: "listings#index"
  # get "listings/:id/edit", to: "listings#edit", as: :listings_edit
  # patch "listings/:id", to: "listings#update"
  # delete "listings/:id", to: "listings#destroy"
  # Defines the root path route ("/")
  # root "articles#index"

  # get "lists", to: "lists#index"
  # get "lists", to: "lists#new"
  # # get "lists/new", to: "lists#new"
  # post "lists", to: "lists#create"
  # get "lists/:id", to: "lists#show", as: :list
  # get "lists/:id/edit", to: "lists#edit", as: :list_edit
  # patch "lists/:id", to: "lists#update"
  # delete "lists/:id", to: "lists#destroy"

end
