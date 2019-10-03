class PatientsController < ApplicationController

  def index
    respond_to do |format|
      format.json { render json: Patient.all }
      format.html { render :index }
    end
  end

  def show
    @facility = Facility.first
    @patient = Patient.find(params[:id])
  end
end