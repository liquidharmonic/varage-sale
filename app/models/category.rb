class Category < ActiveRecord::Base

  has_many :items

  #attr_accessor :name

  # results per page for paginate gem
  self.per_page = 20
end
