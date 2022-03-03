Rails.application.routes.draw do
  devise_for :users
  resources :movies

  # Genre
  get '/genres/:genre', :to => 'movies#getGenre'

  # Search by name
  get '/search', :to => 'movies#search'

  root "movies#index"
end
