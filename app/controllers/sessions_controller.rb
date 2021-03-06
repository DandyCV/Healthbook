class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    if @current_user
      redirect_to clinic_index_url
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
    session[:user_id] = user.id
    if user.is_admin
      redirect_to admin_url
    else
      redirect_to clinic_index_url
    end
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to clinic_index_url, notice: "Logged out"
  end
end
