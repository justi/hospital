Rails.application.routes.draw do

  devise_for :users, path: 'auth', path_names: { sign_in: 'login' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :users, only: [:edit] do
    member do
      delete :delete_avatar_attachment
    end
  end
  root to: "staffs#index"
  resources :bills
  resources :bill_items
  resources :appointments
  resources :reservations
  resources :staffs
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
