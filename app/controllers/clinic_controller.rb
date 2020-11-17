class ClinicController < ApplicationController
  skip_before_action :authorize
  def index
    @doctors = Doctor.order(:name)
  end

  def calendar

  end
end
