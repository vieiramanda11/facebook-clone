module PagesHelper
    def user_gravatar(user, size: 80)
        gravatar_id = Digest::MD5::hexdigest(user.eamil.downcase)
        gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "profile-pic")
    end
end
