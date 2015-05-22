Rails.application.routes.draw do

  root "pages#home"

  get '/about' => 'pages#about'
  get '/divers' => 'divers#index'

  # get '/fires' => 'fires#index'
  # post '/fires' => 'fires#create'
  # get 'fires/:id/edit', to: 'fires#edit', as: 'edit_fire'
  # patch '/fires/:id', to: 'fires#update'
  # get '/fires/:id', to: 'fires#show', as:'fire'
  # delete '/fires/:id', to: 'fires#destroy'

  resources :divers 
  resources :fires do
    member do
      post 'like'
    end
  end

end
