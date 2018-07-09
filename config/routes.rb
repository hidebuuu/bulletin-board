Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create]
  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create edit update destroy]
    resources :follows, only: %i[create destroy]
  end
  resources :follows, only: %i[index]
  resources :notifications, only: %i[index]
  resources :password_resets, only: %i[new create edit update]
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'

 namespace :admin do
    get    '/login' => 'user_sessions#new'
    post   '/login' => 'user_sessions#create'
    resources :dashboards, only: %i[index]
  end
  get '/not_admin' => 'admin#notadminuser'
  root 'dashboards#index'
end
