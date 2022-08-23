class AirportsController < ApplicationController
  AIRPORTS = [
    Airport.new("EGNT", "Newcastle"),
    Airport.new("EGLL", "Heathrow"),
    Airpott.new("EGPH", "Edinburgh"),
    Airport.new("KBWI", "Baltimore"),
    Airport.new("KJFK", "JFK"),
    Airport.new("KONT", "Ontario"),
    Airport.new("MMIA", "Colima")
  ]

  def index
    render "autocomplete/list", locals: {dom_id: params[:dom_id], entries: airports_matching(params[:q]), value: :icao, name: :display_name}
  end

  private

  def airports_matching(query)
    return [] if query.blank? || query.length <= 2

    AIRPORTS.filter do |airport|
      airport.name =~ /#{query}/i || airport.icao =~ /^#{query}/i
    end
  end
end
