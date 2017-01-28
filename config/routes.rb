Rails.application.routes.draw do
  resources :phases
  resources :pipes
  resources :organizations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
