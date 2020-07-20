Rails.application.routes.draw do
  get 'welcome/index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :articles
  resources :users, except: [:new]
  root 'articles#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
