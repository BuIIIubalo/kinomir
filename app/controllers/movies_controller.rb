class MoviesController < ApplicationController

  def index
    # Recommendations
    @advise = Movie.where(recomended: true)

    # Movie Categories (Sliders in future)
    @movies = Category.find_by_name('movie').movies.limit(7)
    @series = Category.find_by_name('series').movies.limit(7)
    @cartoons = Category.find_by_name('cartoon').movies.limit(7)

    # Movie Genres
    @genres = Genre.all
  end

  def show
    @movie = Movie.find(params[:id]);
    @recommendations = Genre.find(@movie.genres.first.id).movies.limit(7)
  end

  # Filtered movies

  def getCollection
    @pagy, @movies = pagy(Category.find_by_name(params[:category]).movies, items: 35)
    render :collection
  end

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

  # Test
  def getCollectionWithGenre
    category = Movie.joins(:categories).where(categories: { name: params[:category] })
    @pagy, @movies = pagy( category.joins(:genres).where(genres: { name: params[:genre] }), items: 35)
    render :collection
  end

  private

  def set_movies
    @movies = Movie.all
  end

end