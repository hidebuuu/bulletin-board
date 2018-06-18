Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create]
  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create]
  end
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'
  root 'dashboards#index'
end
