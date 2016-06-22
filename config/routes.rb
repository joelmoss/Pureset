Rails.application.routes.draw do
  devise_for :users

  resources :organizations
  resources :issues
  resources :projects, only: [:index, :new, :create]

  scope ':username' do
    get '', to: 'accounts#show', as: :account
    get ':project', to: 'projects#show', as: :project
  end

  root 'home#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
