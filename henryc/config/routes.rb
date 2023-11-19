Rails.application.routes.draw do
  resources :reservations, only: [:create, :destroy, :update], :defaults => { :format => :json }, constraints: lambda { |req| req.format == :json }

  resources :openings, only: [:create, :index], :defaults => { :format => :json }, constraints: lambda { |req| req.format == :json }
end
