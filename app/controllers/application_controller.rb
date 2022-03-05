class ApplicationController < ActionController::Base
  # Pagy gem
  include Pagy::Backend

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
  end

  def authenticate_admin!
    return if authenticate_user!
    redirect_to root_path unless current_user.admin?
  end

end
