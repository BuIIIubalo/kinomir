class MoviesController < ApplicationController

  before_action :set_movie, only: %i[show update]

  before_action :authenticate_admin!, only: %i[edit]
  before_action :authenticate_user!, only: %i[show edit]

  def index
    # RECOMMENDATIONS
    @advise = Movie.where(recomended: true)

    # MOVIES SECTIONS
    @comedies = Movie.in_genres('комедия').limit(14)
    @actions = Movie.in_genres('боевик').limit(14)
    @fantastics = Movie.in_genres('фантастика').limit(14)
    @cartoons = Movie.in_genres('мультфильм').limit(14)

    # NEWS SECTION
    @news = New.all.limit(5)

    # GENRES SECTION
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
    @recommendations = Genre.find(@movie.genres.first.id).movies.limit(7) unless @movie.genres.blank?
    @comments = @movie.comments.order(:created_at => :desc)
  end

  # Filtered movies

  def getGenre
    @pagy, @movies = pagy(Movie.in_genres(params[:genre]), items: 35)
    render :collection
  end

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

  def set_movies!
    @movies = Movie.all
  end

  def movie_params
    params.require(:movie).permit(:name_ru, :year, :film_length, :description, :recomended)
  end
end