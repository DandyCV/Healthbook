class User < ApplicationRecord
  after_destroy :ensure_an_admin_remains
  before_save {self.email = email.downcase}
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A(.+)@(.+)\z/ ,
                                                message: 'Looks like not an email address'}
  validates :phone_number, uniqueness: true, format: { with: /\A\d{11,13}\z/ ,
                                                       message: 'Looks like not a phone number'}

  private
  def ensure_an_admin_remains
    if User.where(is_admin: true).count.zero?
      raise Error.new "Can't delete last admin user"
    end
  end

end

class Error < StandardError
end