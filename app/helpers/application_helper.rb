module ApplicationHelper

  def profile_img(user)
    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, class: "user-img img-tunmbnail img-circle", alt: user.name)
  end

end
