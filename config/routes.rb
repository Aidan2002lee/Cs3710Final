Rails.application.routes.draw do
  resources :accounts
  resources :playlists
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions',
    passwords: 'accounts/passwords',
    playlists: 'accounts/playlists'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Generalizes users playlists are connected to main account
  resources :accounts do
    resources :playlists
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
