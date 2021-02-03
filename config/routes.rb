Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'diaries#index'
  resources :diaries
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
