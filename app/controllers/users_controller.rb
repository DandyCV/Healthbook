class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create, :new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    if @current_user.is_admin
      @users = User.order(:name)
    else
      redirect_to @current_user
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @current_user.is_admin || session[:user_id] == @user.id
      @visits = Visit.order(start_time: :desc).where(user_id: @user)
    else
      redirect_to @current_user
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless @current_user.is_admin || session[:user_id] == @user.id
      redirect_to @current_user
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url, notice: "User #{@user.name} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @current_user.is_admin || session[:user_id] == @user.id
      respond_to do |format|
        if @user.update(update_user_params)
          format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @current_user
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @current_user.is_admin || session[:user_id] == @user.id
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to @current_user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :birthday, :phone_number, :is_admin)
    end

    def update_user_params
      if @current_user && @current_user.is_admin?
        params.require(:user).permit(:name, :surname, :birthday, :phone_number, :is_admin)
      else
        params.require(:user).permit(:name, :surname, :birthday, :phone_number)
      end
    end
end
