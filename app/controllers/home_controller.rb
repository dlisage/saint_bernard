class HomeController < ApplicationController
  def index
    @patient = Patient.first
  end
end
