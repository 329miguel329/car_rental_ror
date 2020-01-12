Rails.application.routes.draw do
  resources :blood_types
  root "card_types#index"
  resources :card_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
