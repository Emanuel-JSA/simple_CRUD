Rails.application.routes.draw do
  root 'home#index'

  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
end
