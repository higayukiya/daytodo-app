Rails.application.routes.draw do
  devise_for :users

  root to: 'boards#index'

  resources :boards, only: [:show, :new, :create, :edit, :update, :destroy]

  resource :profile, only: [:show, :edit, :update, :create, :destroy]
end
