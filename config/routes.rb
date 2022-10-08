Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  namespace :api do
    namespace :v1 do
      resource :sessions, only: %i[create destroy] do
        post :refresh, on: :collection
      end
      resource :registers, only: %i[create]
      resources :rooms, only: %i[index show create edit update destroy] do
        collection do
          get :recent
        end
      end
      resources :profile, only: %i[update]
      resources :applies, only: %i[index create destroy] do
        collection do
          get :my_applications
        end
        member do
          patch :read
        end
      end
      resources :agreements, only: %i[index create]
      resources :password_resets, only: %i[create update]
      resources :clans, only: %i[index show create edit update destroy] do
        collection do
          get :my_clan
        end
      end

      namespace :admin do
        resource :sessions, only: %i[create destroy] do
          post :refresh, on: :collection
        end
        resources :users, only: %i[index create update destroy]
        resources :rooms, only: %i[index update destroy]
        resources :applies, only: %i[index update destroy]
        resources :clans, only: %i[index update destroy]
      end
    end
  end

  get 'search', to: 'search#search'
  get 'map_rotation', to: 'search#map_rotation'
end
