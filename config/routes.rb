Rails.application.routes.draw do
  namespace :api do
    resources :choruses, only: [:index, :show] do
      resources :responses, only: [:index, :show]
    end
  end
end
