Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      post 'login' => 'sessions#login'
      post 'logout' => 'sessions#logout'
      get 'agreements' => 'agreements#index'
    end
  end
end
