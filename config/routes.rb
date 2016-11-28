Rails.application.routes.draw do

  get 'links/manager' => 'links#manager', as: :manager_link

  get 'links/employee'

  resources :studies
  resources :managers, only: [:show, :new, :create, :destroy]
  resources :sessions, only: [:show, :new, :create, :destroy]
  resources :employees, only: [:show, :new, :create, :destroy]
  resources :researchers
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
