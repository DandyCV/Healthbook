class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    if @current_user.is_admin
      @visits = Visit.order(start_time: :desc).where(doctor_id: @doctor)
    else
      redirect_to doctors_url
    end
  end

  # GET /doctors/new
  def new
    if @current_user.is_admin
      @doctor = Doctor.new
    else
      redirect_to doctors_url
    end
  end

  # GET /doctors/1/edit
  def edit
    unless @current_user.is_admin
      redirect_to doctors_url
    end
  end

  # POST /doctors
  # POST /doctors.json
  def create
    if @current_user.is_admin
      @doctor = Doctor.new(doctor_params)
      respond_to do |format|
        if @doctor.save
          format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
          format.json { render :show, status: :created, location: @doctor }
        else
          format.html { render :new }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to doctors_url
    end



  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    if @current_user.is_admin
      respond_to do |format|
        if @doctor.update(doctor_params)
          format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
          format.json { render :show, status: :ok, location: @doctor }
        else
          format.html { render :edit }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to doctors_url
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    if @current_user.is_admin
      @doctor.destroy
      respond_to do |format|
        format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to doctors_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:name, :surname, :specialization, :phone_number, :work_hours, :photo_url)
    end
end
