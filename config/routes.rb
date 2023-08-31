Rails.application.routes.draw do
  resources :campers, only: [:index, :show, :create]
  resources :activities, only: [:index, :destroy]
  resources :signups, only: [:create]

  get '/campers/:id', to: 'campers#show_with_activities'
end