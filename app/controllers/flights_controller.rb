class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.create!(flight_params)
  end

  def index
    @flights = Flight.all.order(created_at: :desc)
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport, :arrival_airport)
  end
end
