module AccountsHelper
  def avatar_url(user, size = 20)
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}.png?s=#{size}"
  end

  def avatar_image(user, size = 20)
    image_tag avatar_url(user, size)
  end
end
