class Seller < ActiveRecord::Base

  has_many :items

  #attr_accessor :name, :latitude, :longitude

  # results per page for paginate gem
  self.per_page = 20
end
