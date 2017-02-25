module PagesHelper
  def in_stock
    @product.availability == "In Stock"
  end

  def less_quantity
    @product.quantity < 3
  end

  def check_availability(product)
    case product.availability
    when "In Stock"
      "<span class='label label-primary'>#{product.availability}</span>".html_safe
    when "Pre Order"
      "<span class='label label-primary'>#{product.availability}</span>".html_safe
    when "Out of Stock"
      "<span class='label label-warning'>#{product.availability}</span>".html_safe
    else
      "<span class='label label-danger'>#{product.availability}</span>".html_safe
    end
  end
end
