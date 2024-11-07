Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # the root route is also mapped to the index action of ArticlesController.
  root "articles#index"

  resources :articles
  # root "articles#index"

  # get "/articles", to: "articles#index"
  # will only show one article with the route parameter :id at a time rather than all with the index action
  # get "/articles/:id", to: "articles#show"

  get "/log", to: "log#index", as: "log"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
