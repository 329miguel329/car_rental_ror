Rails.application.routes.draw do
  get 'dashboard/index'
  root "dashboard#index"

  devise_for :users, :controllers => { registrations: 'users/registrations'}

  resources :blood_types do
    collection do
      get "select2"
    end
  end

  resources :card_types do
    collection do
      get "select2"
    end
  end
end
