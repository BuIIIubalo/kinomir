class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @advise = Movie.where(recomended: true)
  end
end