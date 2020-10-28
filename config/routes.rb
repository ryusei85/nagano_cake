Rails.application.routes.draw do

  namespace :admin do
    resources :products
    root :to => 'products#top'
  end

  resources :products, only: [:index, :show, :top]

  resources :cart_products, only: [:index, :create, :update, :destroy, :destroy_all] do
    delete 'destroy_all'
  end

  resources :users

  resources :deliveries

  resources :orders
  get 'order/confirm' => 'orders#confirm'
  post 'order/confirm' => 'orders#confirm'
  get 'order/thanks' => 'orders#thanks'

  resources :order_products

  root :to => 'products#top'

  get 'home/about'

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	registrations: 'admins/registrations'
  }

  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
