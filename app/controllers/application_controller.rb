class ApplicationController < ActionController::Base
  before_action :authorize, :current_user

  protected

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
