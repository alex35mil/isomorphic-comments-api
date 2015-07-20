require 'api_constraints'
require 'subdomain_constraints'

Rails.application.routes.draw do

  get '/auth/preflight', to: 'application#auth_preflight'

  # with subdomain (not sub-sub domain) just use `constraints: { subdomain: 'api' }`
  namespace :api, defaults: { format: :json }, constraints: SubdomainConstraints.new(subdomain: 'api'), path: '/' do

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      devise_for :users, skip: :all
      devise_scope :api_user do
        post    '/signup',  to: 'registrations#create'
        post    '/login',   to: 'sessions#create'
        delete  '/logout',  to: 'sessions#destroy'
      end

      resources :comments, only: [:index, :show, :create, :destroy]

    end

  end

end
