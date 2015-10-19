Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :products

  root 'products#index'

 
end
