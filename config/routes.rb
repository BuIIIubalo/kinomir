Rails.application.routes.draw do

  # User registration
  devise_for :users

  # User users
  resources :users, only: %i[show edit update]

  post '/users/:id', to: 'users#update'

  # Movies
  resources :movies do
    resources :comments
    resources :likes
  end


  # Genre
  get '/genres/:genre', :to => 'movies#getGenre'

  # Search by name
  get '/search', :to => 'movies#search'

  # Root path
  root "movies#index"
end
