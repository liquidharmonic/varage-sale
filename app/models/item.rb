class Item < ActiveRecord::Base

  belongs_to :category
  belongs_to :seller

  # attr_accessor :category_id, :category, :seller_id, :seller, :title, :description, 
  #               :price_in_cents, :status, :published_date

  STATES = ["available", "pending", "sold", "expired", "banned"]

  validates :category, presence: true, allow_nil: false
  validates :seller, presence: true, allow_nil: false
  validates :title, presence: true, allow_nil: false
  validates :price_in_cents, presence: true, allow_nil: false
  validate :valid_status

  before_create :set_defaults

  def set_defaults
    self.published_date = Time.now.utc
  end

  def valid_status
    unless STATES.include?(self.status)
      @errors[:status] << "Status must be #{STATES}"
    end
  end
end
