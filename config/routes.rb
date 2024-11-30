Rails.application.routes.draw do
  resources :playlists
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions',
    passwords: 'accounts/passwords',
    playlists: 'accounts/playlists',
  }

  resources :tracks
  devise_for :playlists, controllers: {
    tracks: 'playlists/tracks'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Generalizes users playlists are connected to main account
  resources :accounts do
    resources :playlists
  end

  resources :playlists do
    resources :songs
  end

  namespace :api do
    namespace :v1 do
      delete 'accounts/log_out:id', to: 'accounts#log_out', as: :account_log_out
      resources :songs do
        collection do
          get :search
        end
      end
    end
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check




  # Defines the root path route ("/")
  # root "posts#index"
end
