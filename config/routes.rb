Rails.application.routes.draw do
  root to: 'services#index'
  resources :services, only: [:index, :show]

  namespace :admin do
    root to: 'services#index'
    resources :services
  end

  namespace :api do
    resources :services
  end
end
