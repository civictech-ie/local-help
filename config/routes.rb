Rails.application.routes.draw do
  root to: 'services#index'
  resources :services, only: [:index, :show]

  namespace :api do
    resources :services
  end
end
