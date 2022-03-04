Rails.application.routes.draw do

  # User registration
  devise_for :users

  # Movies
  resources :movies

  # User profile
  resources :profiles, only: %i[show]

  # Genre
  get '/genres/:genre', :to => 'movies#getGenre'

  # Search by name
  get '/search', :to => 'movies#search'

  # Root path
  root "movies#index"
end
