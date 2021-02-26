Rails.application.routes.draw do
  devise_for :users

  root to: 'boards#index'

  resources :boards do
    resources :tasks do
      resource :comment, only: [:new, :create]
    end
    
  end

  resource :profile, only: [:show, :edit, :update, :create, :destroy]

end
