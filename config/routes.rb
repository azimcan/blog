Rails.application.routes.draw do
  root 'posts#index'

  # defaults format: :json do
  #   resources :comments, path: '/api/comments'
  # end

  # defaults format: :json do
  #   resources :posts, path: '/api/posts'
  # end

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :posts do
    resources :comments
  end

  get '/add_username', to: 'add_username#edit', as: :add_username
  patch '/add_username', to: 'add_username#update', as: :add_username_update

  resources :users, only: %i[new create show]

  get '/:username', to: 'users#show', as: :profile
  get '/:username/edit', to: 'users#edit', as: :edit_user
  patch '/:username', to: 'users#update', as: :update_user
end
