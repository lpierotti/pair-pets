Rails.application.routes.draw do
	post '/matched', to: 'matches#create', as: "perfect_match"
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
  post '/pets/:id/edit', to: 'pets#update'
  get '/pets/:id/edit', to: 'pets#edit'
  post '/pets/:id/delete', to: 'pets#destroy', as: 'delete'
  get '/pets/:id/delete', to: 'pets#destroy'
    post '/messages/:id/delete', to: 'messages#destroy', as: 'delete_message'
  get '/messages/:id/delete', to: 'messages#destroy'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  post '/pets/new', to: 'pets#create'
  post '/messages/new', to: 'messages#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
