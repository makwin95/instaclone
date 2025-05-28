# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get 'users/', to: 'devise/registrations#new'
    get 'users/password', to: 'devise/passwords#new'
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  get 'home/about'
  get 'posts/myposts'
  get 'profiles/index'
  resources :posts
  resources :comments
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  resources :likes, only: [:create, :destroy]

  post 'users/:id/follow', to: 'users#follow', as: 'follow'
  post 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  post 'users/:id/accept', to: 'users#accept', as: 'accept'
  post 'users/:id/decline', to: 'users#decline', as: 'decline'
  post 'users/:id/cancel', to: 'users#cancel', as: 'cancel'

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'posts#index'
end
