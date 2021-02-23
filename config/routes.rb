Rails.application.routes.draw do
  devise_for :users

  root to: 'boards#index'

  resources :boards do
    resources :tasks, only: [:new, :create, :show]
    
  end

  resource :profile, only: [:show, :edit, :update, :create, :destroy]

  resources :task, only:   [:show, :new, :create, :edit, :update, :destroy]
end
