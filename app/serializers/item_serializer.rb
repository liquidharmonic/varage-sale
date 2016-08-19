class ItemSerializer < ActiveModel::Serializer
  attributes  :title, :description, :category_name,
              :price, :status, :published_date,
              :seller_name, :seller_latitude, :seller_longitude

  def price
    (object.price_in_cents / 100).round(2)
  end

  def category_name
    object.category.name
  end

  def seller_name
    object.status != 'banned' ? object.seller.name : nil
  end

  def seller_latitude
    object.seller.latitude
  end

  def seller_longitude
    object.seller.longitude
  end

  def published_date
    object.status != 'banned' ? object.published_date : nil
  end

end