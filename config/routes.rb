Rails.application.routes.draw do
  root 'home#index'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
