Rails.application.routes.draw do
  resources :reservations, only: [:create, :destroy, :update]

  resources :openings, only: [:create, :index]
end
