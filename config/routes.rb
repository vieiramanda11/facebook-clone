# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controller: {
    confirmation: 'confirmation'
  }
  root 'pages#index'


  resources :posts
  resources :users, only: [:show, :edit, :update, :index]
  resources :comments
  resources :likes
  
  resources :posts do
    resources :likes
  end

  resources :users do
    resources :friendships
    delete 'unfriend', to: 'friendships#destroy'
    post 'receive', to: 'friendships#update'
  end

  get 'requests', to: 'friendships#friend_requests'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
