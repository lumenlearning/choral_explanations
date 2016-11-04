Rails.application.routes.draw do
  root to: 'choruses#index'

  post 'lti/choruses/1' => 'choruses#create'

  resources :choruses, only: [:index, :show]

  namespace :api do
    resources :choruses, only: [:index, :show] do
      resources :responses, only: [:index, :show, :create]
    end
  end
end
