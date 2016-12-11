Rails.application.routes.draw do
  devise_for :users

  resources :organizations, only: [:index, :new, :create]

  get ':id', to: 'accounts#show', as: :account
  scope ':account_id' do
    resources :tasks, path: '', only: :show, constraints: { id: /\d*/ }
    resources :projects, only: [:index, :new, :create]
    resources :tasks, only: [:new, :create]
    resources :projects, only: :show, path: '' do
      resources :tasks, path: '', only: :show, constraints: { id: /\d*/ }
      get ':board_name' => 'projects/boards#show', as: :board
      resources :tasks, only: [:new, :create]
    end
  end

  root 'home#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
