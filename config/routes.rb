Rails.application.routes.draw do

  root to: "welcome#index"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_out" => "clearance/sessions#destroy"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  namespace :user do
    resources :lives
    resources :codes
  end

  resources :lives, only: [:index, :show]
  resources :codes, only: [:index, :show]

end
