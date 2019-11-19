# frozen_string_literal: true

module UsersHelper
  def avatar_for(user)
    if user.profile_pic?
      image_tag user.profile_pic.url(:thumb)
    else
      image_tag 'index.png'
    end
  end
end
