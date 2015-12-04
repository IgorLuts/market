Rails.application.routes.draw do
  root 'store#index'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  ActiveAdmin.routes(self)

  post '/rate' => 'rater#create', :as => 'rate' 
  post '/products/:product_id/comments' => 'comments#create', as: 'product_comments'
  get '/katalog' => 'products#index', as: 'products'
  get '/c/:category_id/p/:id' => 'products#show', as: 'category_product'
  get '/c/:id' => 'categories#show', as: 'category'

  resources :visitors, only: [:create]
  resources :articles, only: [:index, :show]
  resources :orders, only: [:new, :create]
  resources :users, :only => [:show]
  resource :shopping_cart, only: [:show, :destroy]
  resource :shopping_cart_items, only: [:create, :destroy]
  resources :contacts, only: [:new, :create]

  get 'o-nas' => 'pages#about', as: 'about'
  get 'oplata-i-dostavka' => 'pages#pay_and_delivery', as: 'pay_and_delivery'
  get 'skidki' => 'pages#sales', as: 'sales'
  get 'vozvrat-tovara' => 'pages#product_return', as: 'product_return'
end
