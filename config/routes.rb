Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :posts do
    resources :comments
  end

  resources :users, only: %i[new edit create update]

  get '/:username', to: 'users#show', as: :profile
  get '/:username/edit', to: 'users#edit', as: :edit_profile
end
