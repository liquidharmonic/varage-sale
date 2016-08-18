class Category < ActiveRecord::Base

  has_many :items

  #attr_accessor :name

end
