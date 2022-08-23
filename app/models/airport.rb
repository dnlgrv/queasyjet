class Airport
  attr_reader :icao, :name, :lat, :lng

  def initialize(icao, name, lat, lng)
    @icao = icao
    @name = name
    @lat = lat
    @lng = lng
  end

  def display_name
    "#{name} (#{icao})"
  end
end
