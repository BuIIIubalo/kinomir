class MoviesController < ApplicationController

  def index
    # RECOMMENDATIONS
    @advise = Movie.where(recomended: true)

    # MOVIES SECTIONS
    @comedies = Movie.in_genres('комедия').limit(7)
    @actions = Movie.in_genres('боевик').limit(7)
    @fantastics = Movie.in_genres('фантастика').limit(7)
    @cartoons = Movie.in_genres('мультфильм').limit(7)

    # NEWS SECTION
    @news = New.all.limit(5)

    # GENRES SECTION
    @genres = Genre.left_joins(:movies)
                   .group(:id)
                   .order('COUNT(movies.id) DESC')
                   .limit(8)
  end

  def show
    @movie = Movie.find(params[:id])
    @recommendations = Genre.find(@movie.genres.first.id).movies.limit(7) unless @movie.genres.blank?
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

  def set_movies
    @movies = Movie.all
  end
end