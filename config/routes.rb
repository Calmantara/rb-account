Rails.application.routes.draw do
  namespace :api do
    # health check API
    # API version 1
    namespace :v1 do
      # health check
      get 'health', to: 'health#index'
      # accounts APi
      resources :accounts, only: %i[index create destroy]
    end
  end
end
