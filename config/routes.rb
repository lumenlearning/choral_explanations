Rails.application.routes.draw do
  root to: 'choruses#index'

  resources :choruses, only: [:index, :show]

  namespace :api do
    resources :choruses, only: [:index, :show] do
      resources :responses, only: [:index, :show]
    end
  end
end
