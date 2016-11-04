Rails.application.routes.draw do
  root to: 'choruses#index'

  post 'lti/choruses/:chorus_id/responses' => 'choruses#create', as: :lti_chorus
  post 'content_item' => 'lti/content_item#content_item'
  get 'content_item_return/:chorus_id' => 'lti/content_item_return#content_item_return', as: :content_item_return
  get 'content_item/config_xml' => 'lti/content_item#config_xml'

  resources :choruses, only: [:index, :show]

  namespace :api do
    resources :choruses, only: [:index, :show] do
      resources :responses, only: [:index, :show, :create]
    end
  end
end
