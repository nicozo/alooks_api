Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :sessions, only: %i[create destroy] do
        post :refresh, on: :collection
      end
      resource :registers, only: %i[create]
      resources :rooms, only: %i[index show create edit update destroy] do
        resources :applies, only: %i[index create destroy]
      end
      resources :profile, only: %i[update]
      
      namespace :admin do
        resources :platforms, only: %i[index create edit update destroy]
        resources :game_mode, only: %i[index create edit update destroy]
      end
    end
  end

  get 'search', to: 'search#search'
end
