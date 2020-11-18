Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'

  resources :static_pages, only: [:index]
  resources :events
  resources :users
  resources :attendances
end
