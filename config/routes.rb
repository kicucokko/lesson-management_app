Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  root to: 'home#index'
  resources :admins, only:[:show,:edit,:update]
  resources :customers, only:[:show,:edit,:update] 

  resources :reviews, only:[:new,:create,:show,:edit,:update,:destroy]
end