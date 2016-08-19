class Item < ActiveRecord::Base

  belongs_to :category
  belongs_to :seller

  scope :available, -> { where(status: AVAILABLE_STATE) }
  scope :sold, -> { where(status: 'sold') }
  # attr_accessor :category_id, :category, :seller_id, :seller, :title, :description, 
  #               :price_in_cents, :status, :published_date

  AVAILABLE_STATE = ["available", "pending"]
  UNAVAILABLE_STATE = ["sold", "expired", "banned"]
  STATES = AVAILABLE_STATE + UNAVAILABLE_STATE

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

  def banned?
    status == 'banned'
  end

  # results per page for paginate gem
  self.per_page = 20
end
