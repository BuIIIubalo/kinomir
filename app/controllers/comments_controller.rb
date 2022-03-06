class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def create
    @comment = @movie.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to movie_path(@movie)
    else
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    @comment = @movie.comments.find(params[:id])
    @comment.destroy

    redirect_to movie_path(@movie)
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end