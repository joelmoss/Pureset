Rails.application.routes.draw do
  devise_for :users

  resources :organizations, except: [:show]
  resources :tasks
  # resources :projects, only: [:index, :new, :create]

  get ':id', to: 'accounts#show', as: :user
  scope ':account_id' do
    resources :projects, path: '' do
      resources :tasks, path: '', only: [:show, :new, :create]
    end
  end

  root 'home#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
