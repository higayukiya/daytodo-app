Rails.application.routes.draw do
  devise_for :users

  root to: 'boards#index'

  resources :boards, only: [:show, :new, :create]

  resource :profile, only: [:show, :edit, :update, :create]
end
