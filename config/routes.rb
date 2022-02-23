Rails.application.routes.draw do
  get 'users/show'
  root 'posts#index'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :posts do
    resources :comments
  end

  get '/:id', to: 'users#show', as: :profile
end
