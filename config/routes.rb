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
    resources :bookmarks
  end

  # Authors
  resources :authors, only: %i[show]

  # News
  get '/news', to: 'news#index'

  # Top-100
  get '/top100', to: 'movies#top100'

  # Genre
  get '/genres/:genre', :to => 'movies#getGenre'

  # Search by name
  get '/search', :to => 'movies#search'

  # Root path
  root "movies#index"
end
