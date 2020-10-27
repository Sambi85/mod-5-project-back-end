Rails.application.routes.draw do
  resources :users  
  resources :posts
  resources :comments
  resources :replies
  
  # change to only create and delete
  resources :likes 
  resources :follows
  
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

end
