Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
    #same as the one below is just short cut
    # resources :articles, only:[:show, :index, :new, :create, :edit, :update, :destroy]
root 'pages#home'
get 'about', to: 'pages#about'
get 'signup', to: 'users#new'
resources :users, except: [:new]
get 'login' , to: 'sessions#new' #to get the data from database
post 'login' , to: 'sessions#create' #to post the form request
delete 'logout', to: 'sessions#destroy'
end
