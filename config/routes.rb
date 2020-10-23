Rails.application.routes.draw do

  get 'about/about'
  namespace :admin do
    resources :products
  end

  resources :products, only: [:index, :show, :top]

  resources :cart_products, only: [:index, :create, :destroy]

  resources :users

  resources :deliveries

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
