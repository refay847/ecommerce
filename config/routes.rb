Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, sign_out_via: [:get, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#home"
  get "/about", to: "pages#about"
  get "/shop", to: "pages#shop"
  get "/news", to: "pages#news"
  get "/single_news", to: "pages#single_news"
  get "/contact", to: "pages#contact"
  get "/single_product", to: "pages#single_product"
  get "/cart", to: "pages#cart"
  get "/checkout", to: "pages#checkout"
  get "/404", to: "pages#error_404"
end
