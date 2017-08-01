Rails.application.routes.draw do

  resources :messages
  resources :playdates
  resources :matches
  resources :swipes
  resources :pets
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/', to: 'sessions#index', as: 'root'
  post '/users/new', to: 'users#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/pets/new', to: 'pets#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
