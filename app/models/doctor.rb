class Doctor < ApplicationRecord
  validates :name, :surname, presence: true
  validates :phone_number, uniqueness: true
  validates :phone_number, allow_blank: true, format:{
      with: /\A\d{10,13}\z/,
      message: 'Phone number has 10-13 digits'
  }
  validates :work_hours, allow_blank: true, format:{
      with: /\A([0-1]\d|2[0-3]):[0-5][0,5]\s-\s([0-1]\d|2[0-3]):[0-5][0,5]\z/,
      message: '00:00 - 23:55 format with step 5 min'
  }

  has_many :visits
  before_destroy :ensure_not_referenced_by_any_visit

  private
  # ensure that there are no visits referencing this doctor
  def ensure_not_referenced_by_any_visit
    unless visits.empty?
      errors.add(:base, 'Visits present')
      throw :abort
    end
  end
end
