class Item < ActiveRecord::Base
  STATUSES = ["SELLING", "SOLD", "NOTSOLD"]

  validates :title, :description, presence: true
  validates :start_price, numericality: { greater_than_or_equal_to: 0.01 }
  validates_inclusion_of :status, in: STATUSES
  validate :validate_end_date

  private
    def validate_end_date
      errors.add(:end_date, "Can't be set the past") if end_date < Time.now
    end
end
