class MoviesController < ApplicationController

  before_action :set_movie, only: %i[show update]
  before_action :set_movies, only: %i[index]

  before_action :authenticate_admin!, only: %i[edit]
  before_action :authenticate_user!, only: %i[show edit]


  def index
    # Recommendations
    @advise = Movie.where(recomended: true)

    # News
    @news = New.all.limit(5)

    # Genres
    @genres = Genre.left_joins(:movies)
                   .group(:id)
                   .order('COUNT(movies.id) DESC')
                   .limit(8)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    if @movie.update movie_params
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def show
    # Movies like this movie genre
    @recommendations = Movie.top_by_likes(14)

    # Movie authors
    @authors = @movie.authors

    # Movie comments
    @comments = @movie.comments.order(:created_at => :desc)
  end

  # Get collection of movies by genre
  def getGenre
    @pagy, @movies = pagy(Movie.in_genres(params[:genre]), items: 35)
    render :collection
  end

  # Get collection of top100 movies
  def top100
    @pagy, @movies = pagy(Movie.top_by_likes(100) , items: 35)
    render :collection
  end

  # Searcher pgSearch
  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @pagy, @movies = pagy(Movie.global_search(params[:search]), items: 35)
      render :collection
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_movies
    @movies = Movie.all
  end

  def movie_params
    params.require(:movie).permit(:name_ru, :year, :film_length, :description, :recomended)
  end
  
end