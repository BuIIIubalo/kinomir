module MovieHelper

  # Return current user avatar or SVG template
  def header_avatar
    if current_user.is_avatar?
      image_tag current_user.avatar, class: 'header-user-avatar'
    else
      tag.i '', class: 'fas fa-user-circle'
    end
  end

  # Is this profile mine?
  def on_my_page
    return params[:id].to_i == current_user.id
  end
  
end