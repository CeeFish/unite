Rails.application.routes.draw do
   resources :users, only: [:new, :create, :delete, :show]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'

   resources :groups
   resources :meetups
end
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html