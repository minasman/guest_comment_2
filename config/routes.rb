Rails.application.routes.draw do
  resources :comments do
   resources :comment_updates, only: [:new, :create, :index]
  end
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/open' => 'comments#open'
  get '/closed' => 'comments#closed'
  get '/auth/facebook/callback' => 'sessions#facebook'
end
