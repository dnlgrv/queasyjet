class Airport
  attr_reader :icao, :name

  def initialize(icao, name)
    @icao = icao
    @name = name
  end

  def display_name
    "#{name} (#{icao})"
  end
end
