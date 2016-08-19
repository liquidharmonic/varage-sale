class Item < ActiveRecord::Base

  belongs_to :category
  belongs_to :seller

  # attr_accessor :category_id, :category, :seller_id, :seller, :description, 
  #               :price_in_cents, :status, :published_date

  STATES = ["available", "pending", "sold", "expired", "banned"]

  before_create :set_defaults
  # The set_defaults will only work if the object is new

  def set_defaults
    self.published_date ||= Time.now.utc
  end
end
