class Item < ActiveRecord::Base

  belongs_to :category
  belongs_to :seller

  # attr_accessor :category_id, :category, :seller_id, :seller, :description, 
  #               :price_in_cents, :status, :published_date
end
