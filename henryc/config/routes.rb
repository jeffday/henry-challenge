Rails.application.routes.draw do
  resources :appointments, only: [:index], :defaults => { :format => :json }, constraints: lambda { |req| req.format == :json }
  resources :reservations, only: [:create, :destroy, :update], :defaults => { :format => :json }, constraints: lambda { |req| req.format == :json }

  resources :openings, only: [:create], :defaults => { :format => :json }, constraints: lambda { |req| req.format == :json }
end
