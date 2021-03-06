Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'

  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics, only: [:create, :new, :index, :edit, :update, :destroy]
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get 'comments/new'
  post '/comments', to: 'comments#create'
  delete '/comments', to: 'comments#destroy'
  
  get '/topics/:id/edit' => "topics#edit"
  
end