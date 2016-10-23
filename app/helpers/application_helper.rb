module ApplicationHelper
  def stars(product)
    up_star_str = "<span class='glyphicon glyphicon-star'></span>"
    dwn_star_str = "<span class='glyphicon glyphicon-star-empty'></span>"
    if product.raiting
      up = product.raiting
      dwn = (Review.stars.count - up + 1)
      up_star_str * up + dwn_star_str * dwn
    else
      dwn_star_str * (Review.stars.count + 1)
    end
  end
end
