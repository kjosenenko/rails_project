Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'listings#index'
  
  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]
  
  get '/my_listings' => 'listings#my_listings'
  get '/my_bids' => 'bids#my_bids'
  get '/bids_on_my_listings' => 'bids#bids_on_my_listings'
  get '/find' => 'listings#find'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/users/:user_id/message' => 'conversations#new'

  resources :users, only: :show do
    resources :reviews, only: [:new, :create, :show]
  end

  resources :conversations, except: [:edit, :update, :new] 
  
  resources :messages, only: [:new, :create]

  resources :skills, only: [:index, :show]

  resources :listings do
    resources :bids
  end
   
end