class User < ApplicationRecord
  before_destroy :ensure_an_admin_remains, :ensure_no_visits_for_user
  before_save {self.email = email.downcase}
  has_secure_password
  validates :password, length: { minimum: 4 }
  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A(.+)@(.+)\z/ ,
                                                message: 'Looks like not an email address'}
  validates :phone_number, uniqueness: true, format: { with: /\A\d{11,13}\z/ ,
                                                       message: 'Looks like not a phone number'}
  has_many :visits

  private
  def ensure_an_admin_remains
    if is_admin && User.where(is_admin: true).count == 1
      errors.add(:base, 'User is last admin')
      throw :abort
    end
  end

  def ensure_no_visits_for_user
    unless visits.empty?
      errors.add(:base, 'User has visits')
      throw :abort
    end
  end
end

class Error < StandardError
end