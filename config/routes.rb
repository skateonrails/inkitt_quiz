Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: %i[index create]

  resources :questions, only: [:show] do
    resources :answers, only: [:create]
  end
end
