Rails.application.routes.draw do
  namespace :api  do
  	namespace :v1 do
  	  # post 'auth/register', to: 'users#register'
  	  post 'auth/login', to: 'users#login'
  	  post 'auth/register', to: 'users#register'
  	   get '/max' , to: 'events#set_token'
       get '/long' , to: 'events#get_token'
      # get '/long', to: 'users#long'
  	  resources :events
  	end
  end
# get '/long', to: 'users#long'
  # post 'auth/login', to: 'users#login'
  # post 'auth/register', to: 'users#register'
  # resources :events
end
