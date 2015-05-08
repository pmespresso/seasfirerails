Rails.application.routes.draw do

  resources :fires
  root "pages#home"

  get '/about' => 'pages#about'

end
