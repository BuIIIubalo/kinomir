Rails.application.routes.draw do
  resources :movies

  # Category
  get '/categories/:category', :to => 'movies#getCollection'

  # Genre
  get '/genres/:genre', :to => 'movies#getGenre'

  #Filter
  get '/categories/:category/:genre', :to => 'movies#getCollectionWithGenre'

  root "movies#index"
end
