Rails.application.routes.draw do

  namespace :admin do
    root :to => 'products#top'
    resources :products, only: [:top, :new, :create, :show,:edit, :update, :destroy, :index]
    resources :users, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show]
    get 'home/about'
  end


  resources :products, only: [:index, :show, :top]

  resources :cart_products, only: [:index, :create, :update, :destroy, :destroy_all] do
    delete 'destroy_all'
  end

  resources :users, only: [:show, :edit, :update, :withdrawl] do
    member do
      get 'check'
      patch "withdrawl"
    end
  end

  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]

  resources :orders, only: [:new, :create, :index, :show]
  
  get 'confirm' => 'orders#confirm'
  post 'confirm' => 'orders#confirm'
  get 'thanks' => 'orders#thanks'

  resources :order_products, only: [:create]

  root :to => 'products#top'

  get 'home/about'

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	registrations: 'admins/registrations'
  }

  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations',
    passwords: 'end_users/passwords'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
