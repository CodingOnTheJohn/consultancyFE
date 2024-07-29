Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "welcome#index"

  resources :users, only: [:new, :create]
  resources :ruby_lessons, only: [:index, :show]
  resources :javascript_lessons, only: [:index, :show]
  resources :interview_lessons, only: [:index, :show]
  post "/openai" => "openai#tell_me_more", as: :openai
end
