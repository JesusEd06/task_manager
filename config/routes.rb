Rails.application.routes.draw do

  root 'tasks#index'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'  # Página de login
  post '/login', to: 'sessions#create'  
  delete '/logout', to: 'sessions#destroy' 
  
  resources :users
  resources :tasks

end
