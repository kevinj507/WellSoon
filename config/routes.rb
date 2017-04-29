Rails.application.routes.draw do
  devise_for :entries
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :confirm_email
    end
  end
  root 'entries#index'
end
