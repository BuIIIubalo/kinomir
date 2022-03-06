class UsersController < ApplicationController

  before_action :authenticate_user!

  before_action :set_user, only: %i[show update]
  before_action :authenticate_user!

  def show

    # Liked movies (last 8 items)
    @liked_movies = Movie.liked_movies(params[:id]).order("likes.created_at DESC").limit(8)
  end

  def edit
    @user = current_user
  end

  def update
    #render plain: params

    if @user.update user_params
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

end