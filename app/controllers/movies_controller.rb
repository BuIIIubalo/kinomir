class MoviesController < ApplicationController

  def index
    # Recommendations
    @advise = Movie.where(recomended: true)

    # Movie Genres (Sliders in future)
    @comedies = Genre.find_by_name('комедия').movies.limit(7)
    @actions = Genre.find_by_name('боевик').movies.limit(7)
    @fantastics = Genre.find_by_name('фантастика').movies.limit(7)
    @cartoons = Genre.find_by_name('мультфильм').movies.limit(7)

    # News
    @news = New.limit(5)

    # Movie Genres
    @genres = Genre.left_joins(:movies)
                   .group(:id)
                   .order('COUNT(movies.id) DESC')
                   .limit(8)
  end

  def show
    @movie = Movie.find(params[:id])
    @recommendations = Genre.find(@movie.genres.first.id).movies.limit(7)
  end

  # Filtered movies

  def getGenre
    @pagy, @movies = pagy(Genre.find_by_name(params[:genre]).movies, items: 35)
    render :collection
  end

  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      @pagy, @movies = pagy(Movie.search(@parameter), items: 35)
      render :collection
    end
  end

  private

  def set_movies
    @movies = Movie.all
  end

end