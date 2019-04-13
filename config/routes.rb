Rails.application.routes.draw do

  devise_for :users
  root to: "staffs#index"
  resources :bills
  resources :bill_items
  resources :appointments
  resources :reservations
  resources :staffs
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
