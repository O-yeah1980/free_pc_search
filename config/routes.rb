Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  devise_scope :user do
    get "children", to: "users/registrations#children"
    get "grandchildren", to: "users/registrations#grandchildren"
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end
  
  root "searches#index"
  resources :searches, except: :index
end
