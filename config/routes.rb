Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  ActiveAdmin.routes(self)

  post '/rate' => 'rater#create', :as => 'rate' 

  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resource :shopping_cart
  resource :shopping_cart_item
  root 'products#index'

  get 'about' => 'pages#about'
  get 'news' => 'pages#news'
  get 'pay_and_delivery' => 'pages#pay_and_delivery'
  get 'contact' => 'pages#contact'
  get 'sales' => 'pages#sales'
  get 'product_return' => 'pages#product_return'
end
