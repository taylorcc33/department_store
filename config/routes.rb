Rails.application.routes.draw do
  root "departments#index"
  # get 'departments/index'
  # get 'departments/show'
  # get 'departments/new'
  # get 'departments/edit'
  resources :departments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
