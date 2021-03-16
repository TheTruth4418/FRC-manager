Rails.application.routes.draw do
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
  
  end
end
