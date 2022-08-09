Rails.application.routes.draw do
   resources :users
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'about', to: 'sessions#about'
   get 'authorized', to: 'sessions#page_requires_login'
   get "logout", to: 'sessions#destroy', as: :logout

   resources :groups
   resources :meetups
   resources :sessions
   root to: 'users#new'
end
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html