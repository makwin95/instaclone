# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get 'users/', to: 'devise/registrations#new'
    get 'users/password', to: 'devise/passwords#new'
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users

  get 'home/about'
  get 'posts/myposts'
  resources :posts

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'posts#index'
end
