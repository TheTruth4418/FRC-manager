Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :teams, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :tasks
  resources :events do
    resources :confirms
    resources :participants
  end
  resources :sessions, only: [:new,:create,:destroy]

  root 'users#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/home', to: 'users#show'
  get '/edit_username', to: 'users#edit'

  get '/join', to: 'teams#join'
  post '/join', to: 'teams#register'
 

end

#fix the scout routing