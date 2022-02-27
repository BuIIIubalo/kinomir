class MoviesController < ApplicationController
  def index

    @advise = Movie.where(recomended: true)

    #Categories
    @pagy, @movies = pagy(Category.find_by_name('movie').movies)
    @pagy, @series = pagy(Category.find_by_name('series').movies)
    @pagy, @cartoons = pagy(Category.find_by_name('cartoon').movies)
  end

  def show
    @movie = Movie.find(params[:id]);
  end
end