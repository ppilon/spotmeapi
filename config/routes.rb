require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations] 
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
      resources :schools, :only => [:show, :create]
      resources :admins, :only => [:show]
      resources :alerts, :only => [:index, :show, :create, :update]
    end
  end
end
