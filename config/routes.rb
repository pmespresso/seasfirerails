Rails.application.routes.draw do

  root "pages#home"

  get '/about' => 'pages#about'

  resources :divers , except: [:new]

  get '/register', to: 'divers#new'

  resources :fires do
    member do
      post 'like'
    end
  end

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  get 'logout', to: 'logins#destroy'
  
  resources :styles, only: [:new, :create, :show]
  resources :objectives, only: [:new, :create, :show]

end
