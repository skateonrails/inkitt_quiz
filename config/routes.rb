Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: %i[index create]

  resources :answers, only: [:index]
  resources :questions, only: [:show] do
    resources :answers, only: [:create, :update]
  end
end
