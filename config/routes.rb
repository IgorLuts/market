Rails.application.routes.draw do
  resources :categories
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :products

  root 'products#index'

 
end
