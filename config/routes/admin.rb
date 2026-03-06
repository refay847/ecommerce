namespace :admin do
  root "home#index"
  resources :orders, only: [:index, :show] do
    member do
      patch :update_status
    end
  end
  resources :products do
    member do
      patch :toggle_active
    end
  end
  resources :categories do
    member do
      patch :toggle_active
    end
  end

end