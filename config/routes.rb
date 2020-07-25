Rails.application.routes.draw do
  devise_for :users
  root "searches#index"
  resources :searches, except: :index
end
