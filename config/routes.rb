Rails.application.routes.draw do
  root to: 'services#index'
  resources :services, only: [:index, :show]

  namespace :admin do
    root to: 'services#index'
    resources :services do
      member do
        patch :toggle_publish
      end
    end
  end

  namespace :api do
    resources :services
  end
end
