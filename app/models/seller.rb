class Seller < ActiveRecord::Base

  has_many :items

  #attr_accessor :name, :latitude, :longitude

end
