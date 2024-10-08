Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "welcome#index"
  get "/login_form", to: "users#login_form", as: "login_form"
  get "/login", to: "users#login", as: "login"
  get "/logout", to: "users#logout", as: "logout"
  get "/auth/github/callback", to: "users#github_callback"

  resources :users, only: [:new, :create] do
    get "/dashboard", to: "users#dashboard"
  end

  resources :lessons, only: [:index, :show]
  # resources :ruby_lessons, only: [:index, :show]
  # resources :javascript_lessons, only: [:index, :show]
  # resources :interview_lessons, only: [:index, :show]
  post "/openai" => "openai#tell_me_more", as: :openai
end
