# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rosters
  devise_for :users
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  resources :users

  resources :rosters do
    resources :participants
  end
end
