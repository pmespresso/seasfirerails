Rails.application.routes.draw do

  resources :logs
  root "pages#home"
end
