Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :sessions, only: %i[create]
      resource :registers, only: %i[create]
      resources :users, only: %i[create]
    end
  end
end
