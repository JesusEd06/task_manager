Rails.application.routes.draw do

  root 'static_pages#home'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'  # Página de login
  post '/login', to: 'sessions#create'  
  delete '/logout', to: 'sessions#destroy' 
  
  resources :users
end
