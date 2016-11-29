Rails.application.routes.draw do

  get 'links/manager' => 'links#manager', as: :manager_link

  get 'links/employee' => 'links#employee', as: :employee_link

  resources :studies do
    resources :manager_surveys
  end
  resources :managers, only: [:show, :new, :create, :destroy] do
    resources :manager_entries, only: [:show, :new, :create, :destroy]
  end
  resources :sessions, only: [:show, :new, :create, :destroy]
  resources :employees, only: [:show, :new, :create, :destroy]
  resources :researchers
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
