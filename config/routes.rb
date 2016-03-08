Rails.application.routes.draw do
  devise_for :users
  resources :organizations
  resources :issues

  get ':username', to: 'accounts#show'

  root 'welcome#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
