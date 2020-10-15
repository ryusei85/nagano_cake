Rails.application.routes.draw do

  namespace :admin do
    resources :products
  end

  root :to => 'admin/products#top'

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
