Rails.application.routes.draw do

  get 'links/manager' => 'links#manager', as: :manager_link

  get 'links/employee' => 'links#employee', as: :employee_link


  resources :studies do
    get '/managers-download' => 'downloads#all_managers', as: :all_managers_download
    get '/employees-download' => 'downloads#all_employees', as: :all_employees_download
    get '/manager_survey/:id/set_status' => 'manager_surveys#set_status', as: :set_manager_survey_status
    get '/employee_survey/:id/set_status' => 'employee_surveys#set_status', as: :set_employee_survey_status
    get 'manager_survey/active' => 'manager_surveys#show_active', as: :active_manager
    get 'employee_survey/active' => 'employee_surveys#show_active', as: :active_employee
    resources :manager_surveys
    resources :employee_surveys
  end
  resources :managers, only: [:show, :new, :create, :destroy] do
    get '/download' => 'downloads#ind_manager', as: :ind_download
    resources :manager_entries, only: [:show, :new, :create, :destroy]
  end
  resources :sessions, only: [:show, :new, :create, :destroy]
  resources :employees, only: [:show, :new, :create, :destroy] do
    get '/download' => 'downloads#ind_employee', as: :ind_download
    resources :employee_entries, only: [:show, :new, :create, :destroy]

  end

  resources :researchers
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
