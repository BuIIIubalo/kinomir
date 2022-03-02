Rails.application.routes.draw do
  devise_for :users
  resources :movies

  # Category
  get '/categories/:category', :to => 'movies#getCategory'

  # Genre
  get '/genres/:genre', :to => 'movies#getGenre'

  #Filter
  get '/categories/:category/:genre', :to => 'movies#getCollectionWithGenre'

  # Search by name
  get '/search', :to => 'movies#search'


  root "movies#index"
end
