class MoviesController < ApplicationController
  def index

    @advise = Movie.where(recomended: true)

    # Movie Categories
    @pagy, @movies = pagy(Category.find_by_name('movie').movies, items: 7)
    @pagy, @series = pagy(Category.find_by_name('series').movies, items: 7)
    @pagy, @cartoons = pagy(Category.find_by_name('cartoon').movies, items: 7)

    # Movie Genres
    @genres = Genre.all

  end

  def show
    @movie = Movie.find(params[:id]);
  end

  # Categories

  def getMovies
    @pagy, @movies = pagy(Category.find_by_name('movie').movies, items: 35)
    render :category
  end

  def getSeries
    @pagy, @movies = pagy(Category.find_by_name('series').movies, items: 35)
    render :category
  end

  def getCartoons
    @pagy, @movies = pagy(Category.find_by_name('cartoon').movies, items: 35)
    render :category
  end

  def getRecommendations
    @pagy, @movies = pagy(Movie.where(:recomended => true), items: 35)
    render :category
  end

end