Rails.application.routes.draw do
  resources :contracts
  get 'dashboard/index'
  post 'dashboard/create_form'
  root "dashboard#index"

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users do
    collection do
      get 'select2'
    end
  end

  resources :passengers do
    collection do
      get 'select2'
    end
  end

  resources :blood_types do
    collection do
      get 'select2'
    end
  end

  resources :card_types do
    collection do
      get 'select2'
    end
  end
end
