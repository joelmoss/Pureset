Rails.application.routes.draw do
  devise_for :users

  get ':id', to: 'accounts#show', as: :user
  scope ':account_id' do
    resources :tasks, path: '', only: :show, constraints: { id: /\d*/ }
    resources :projects, only: [:index, :new, :create]
    resources :tasks, only: [:new, :create]
    resources :projects, only: :show, path: '' do
      resources :tasks, path: '', only: :show, constraints: { id: /\d*/ }
      resources :tasks, only: [:new, :create]
    end
  end

  root 'home#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
