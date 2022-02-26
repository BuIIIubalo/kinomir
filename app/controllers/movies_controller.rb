class MoviesController < ApplicationController
  def index
    @pagy, @movies = pagy(Movie.all)
    @advise = Movie.where(recomended: true)
  end

  def show
    @movie = Movie.find(params[:id]);
  end
end