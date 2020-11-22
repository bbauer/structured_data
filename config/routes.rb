Rails.application.routes.draw do
  resources :analyses
  resources :schemas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'analyses#new'
end
