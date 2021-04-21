Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  root 'pages#home'
get 'about', to: 'pages#about'
resources :articles
get 'signup', to: 'users#new'
resources :users, except: [:new]
end
  #same as the one below is just short cut
  # resources :articles, only:[:show, :index, :new, :create, :edit, :update, :destroy]
