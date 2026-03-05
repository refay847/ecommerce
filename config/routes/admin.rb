namespace :admin do
  root "admin#index"
  get "orders", to: "admin#orders"
  resources :products do
    member do
      patch :toggle_active
    end
  end
  resources :categories

end