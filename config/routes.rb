Rails.application.routes.draw do
  #devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :apartments do
    :filters
  end

  get "/onboarding", to: "onboarding#new"
  post "/onboarding", to: "onboarding#create"

  devise_for :users, controllers: { registrations: "registrations" }

  resources :statuses, only:[:new, :create]

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
end
