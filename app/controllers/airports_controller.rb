class AirportsController < ApplicationController
  AIRPORTS = [
    Airport.new("CYOW", "Ottawa", 45.3192, -75.6692),
    Airport.new("EGNT", "Newcastle", 55.0393, -1.6931),
    Airport.new("EGLL", "Heathrow", 51.4700, -0.4543),
    Airport.new("EGPH", "Edinburgh", 55.9508, -3.3615),
    Airport.new("KBWI", "Baltimore", 39.1774, -76.6684),
    Airport.new("KJFK", "JFK", 40.6413, -73.7781),
    Airport.new("MMIA", "Colima", 19.2806, -103.5774)
  ]

  def index
    render "autocomplete/list", locals: {dom_id: params[:dom_id], entries: airports_matching(params[:q]), value: :icao, name: :display_name}
  end

  def show
    respond_to do |format|
      format.json do
        render json: find_airport(params[:id])
      end
    end
  end

  private

  def airports_matching(query)
    return [] if query.blank?

    AIRPORTS.filter do |airport|
      airport.name =~ /#{query}/i || airport.icao =~ /^#{query}/i
    end
  end

  def find_airport(icao)
    AIRPORTS.find { |airport| airport.icao.downcase == icao.downcase }
  end
end
