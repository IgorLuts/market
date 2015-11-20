Rails.application.routes.draw do
  
  get 'articles/index'

  get 'articles/show'

  get 'news/index'

  get 'news/show'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  ActiveAdmin.routes(self)

  post '/rate' => 'rater#create', :as => 'rate' 

  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show] do
    resources :comments, only: [:create]
  end

  resources :articles, only: [:index, :show]
  resources :orders
  resource :shopping_cart
  resource :shopping_cart_item
  resources :contacts, only: [:new, :create]
  root 'products#index'

  get 'about' => 'pages#about'
  get 'pay_and_delivery' => 'pages#pay_and_delivery'
  get 'sales' => 'pages#sales'
  get 'product_return' => 'pages#product_return'
end
