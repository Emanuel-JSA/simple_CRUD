Rails.application.routes.draw do
  root 'articles#index'

  resources :articles, except: [:index]

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
