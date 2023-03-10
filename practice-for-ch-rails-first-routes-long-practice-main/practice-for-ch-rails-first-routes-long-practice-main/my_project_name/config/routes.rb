Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :update, :show, :destroy, :index] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end


  resources :artworks, only: [:create, :update, :show, :destroy] do
    resources :comments, only: [:index]
  end


  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit', as:'new_user_edit'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
end
