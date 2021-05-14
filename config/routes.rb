Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :teams, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :tasks, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :events do
    resources :confirms, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :participants, only: [:new, :create, :edit, :update, :show, :destroy]
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

  get '/join', to: 'users#join'
  post '/join', to: 'users#register'

  patch '/remove', to: 'users#remove'
 
  get '/auth/google_oauth2/callback' => 'sessions#omniauth' 

end

#fix the scout routing