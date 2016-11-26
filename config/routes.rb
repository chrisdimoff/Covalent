Rails.application.routes.draw do
  resources :sessions
  resources :researchers
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
