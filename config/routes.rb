Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :confirm_email
    end
  end

  resources :entries do
    member do
      post :add
      delete :remove
    end
    collection do
      get :progress
    end

  end
  root 'entries#index'
end
