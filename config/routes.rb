Rails.application.routes.draw do
  resources :field_values
  resources :cards
  resources :types
  resources :fields
  resources :phases
  resources :pipes
  resources :organizations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
