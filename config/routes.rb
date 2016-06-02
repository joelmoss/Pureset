Rails.application.routes.draw do
  devise_for :users

  resources :organizations
  resources :issues
  resources :projects

  get ':username', to: 'accounts#show'

  root 'home#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
