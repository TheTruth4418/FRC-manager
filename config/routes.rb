Rails.application.routes.draw do
  resources :users
  resources :confirm#, only [:new, :create, :edit, :update, :show, :destroy]
  resources :teams, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :tasks
  resources :events do
    resources :participant do
      resources :scout
    end
  end
  resources :sessions, only: [:create, :destroy]

  root 'users#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/home', to: 'users#home'
  get '/edit_username', to: 'users#edit'

  get '/join', to: 'teams#join'
  post '/join', to: 'teams#register'
 

end