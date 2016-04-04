Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  
  resources :shoes do
    member do
      post 'like'
    end
  end
  
  resources :runners, except: [:new]
  
  get '/register', to: 'runners#new'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
end
