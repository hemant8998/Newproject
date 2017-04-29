Rails.application.routes.draw do
	root to: 'employees#index'
	get '/employees/relocation_request' => 'employees#relocation_request'
  resources :employees
  resources :cities
  resources :managers
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
