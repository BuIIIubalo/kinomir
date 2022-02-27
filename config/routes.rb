Rails.application.routes.draw do
  resources :movies

  # Categories
  get '/category-movies', :to => 'movies#getMovies'
  get '/category-series', :to => 'movies#getSeries'
  get '/category-cartoons', :to => 'movies#getCartoons'

  get 'category-recommendations', :to => 'movies#getRecommendations'

  root "movies#index"
end
