Rails.application.routes.draw do
  # resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :create, :destroy, :show, :update]

  #post '/users/:user_id/artworks', to: 'users#index'
  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new' 
  # get 'users/:id/edit', to: 'users#edit'
  # get 'users/:id', to: 'users#show'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :artworks, only: [:index, :create, :destroy, :show, :update]

  resources :artwork_shares, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: [:index]
  end
  

end
