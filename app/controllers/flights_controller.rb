class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end
end
