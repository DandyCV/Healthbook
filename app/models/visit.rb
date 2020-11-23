class Visit < ApplicationRecord
  #minimal interval to cancel the visit - 1 hour
  CANCEL_TIME = 3600

  after_destroy :ensure_that_can_be_canceled
  belongs_to :doctor
  belongs_to :user
  validates :start_time, :end_time, presence: true
  validates_with TimeSlotValidator
  validates_with FreeSlotValidator

  private
  def ensure_that_can_be_canceled
    if (start_time - DateTime.now).to_i < CANCEL_TIME
      raise Error.new "Too late to change this visit"
    end
  end
end