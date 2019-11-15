# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controller: {
    confirmation: 'confirmation'
  }
  root 'pages#index'


  resources :posts
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
