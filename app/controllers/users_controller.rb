class UsersController < ApplicationController

  before_action :set_user, only: %i[show update]
  before_action -> { redirect_to root_path unless user_signed_in? }

  def show

    # Liked movies
    @liked_movies = Movie.liked_movie params[:id]
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