Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'api/v1/users/registrations' }
      post '/auth/sign_in', to: 'sessions#create'
      resources :contents
    end
  end
end
