class BookmarksController < ApplicationController

  before_action :find_movie
  before_action :find_bookmark, only: [:destroy]

  def create
    if already_bookmarked?
      flash[:notice] = "You can't like more than once"
    else
      @movie.bookmarks.create(user_id: current_user.id)
    end
    redirect_to movie_path(@movie)
  end

  def destroy
    if !(already_bookmarked?)
      flash[:notice] = "Cannot unbooked"
    else
      @bookmark.destroy
    end
    redirect_to movie_path(@movie)
  end

  private

  def find_bookmark
    @bookmark = @movie.bookmarks.find(params[:id])
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def already_bookmarked?
    Bookmark.where(user_id: current_user.id, movie_id:
      params[:movie_id]).exists?
  end

end