Rails.application.routes.draw do
  resources :discover, only: [:index, :show]
  resources :user_recipes, only: [:create]
  root "welcome#index"
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'
  delete '/user_recipes', to: 'user_recipes#destroy'
end
