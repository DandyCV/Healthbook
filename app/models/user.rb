
class User < ApplicationRecord
  after_destroy :ensure_an_admin_remains
  has_secure_password
  validates :email, :password, :name, :surname, :phone_number, :birthday, presence: true
  validates :email, uniqueness: true, format: { with: /\A(.+)@(.+)\z/ ,
                                                message: 'Looks like not an email address'}
  validates :password, length: { minimum: 6 }
  validates :phone_number, uniqueness: true, format: { with: /\A\d{11,13}\z/ ,
                                                       message: 'Looks like not a phone number'}

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end

end

class Error < StandardError
end