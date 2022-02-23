Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :users

  resources :posts do
    resources :comments
  end

  get '/:id', to: 'users#show', as: :profile
end
