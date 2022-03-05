module MovieHelper

  # Is this profile mine?
  def on_my_page
    return params[:id].to_i == current_user.id
  end
end