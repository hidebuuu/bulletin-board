Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'users/new' => 'users#new'
  #post 'users/create' => 'users#create'
  resources :users, only: [:new, :create]
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'
  root 'dashboards#index'
end
