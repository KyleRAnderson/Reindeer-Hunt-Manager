Rails.application.routes.draw do

  get 'hello_world', to: 'hello_world#index'
  devise_for :users
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  resources :users
end
