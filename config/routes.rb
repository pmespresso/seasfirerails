Rails.application.routes.draw do

  devise_for :users
  resources :logs
  root "pages#home"
end
