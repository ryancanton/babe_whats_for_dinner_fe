Rails.application.routes.draw do
  resources :discover, only: [:index, :show]
  root "welcome#index"
  get '/auth/github/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'
end
