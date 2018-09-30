Rails.application.routes.draw do
  resources :guests
  resources :comments
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
end
