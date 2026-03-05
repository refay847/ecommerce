namespace :admin do
  root "admin#index"
  get "orders", to: "admin#orders"

end