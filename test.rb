class Subway

  attr_accessor :subway_lines

  def initialize
    @subway_lines = {
      :red => Line.new(
        "Red", [
          "South Station",
          "Park Street",
          "Kendall",
          "Central",
          "Harvard",
          "Porter",
          "Davis",
          "Alewife"
        ]
      ),
      :green => Line.new(
        "Green", [
          "Government Center",
          "Park Street",
          "Boylston",
          "Arlington",
          "Copley",
          "Hynes",
          "Kenmore"
        ]
      ),
      :orange => Line.new(
        "Orange", [
          "North Station",
          "Haymarket",
          "Park Street",
          "State",
          "Downtown Crossing",
          "Chinatown",
          "Back Bay",
          "Forest Hills"
        ]
      )
    }
  end

  def stops_between_stations(start_line, start_station, end_line, end_station)

    puts "\nstart_line"
    p start_line    = start_line.downcase.to_sym
    puts "\nstart_station"
    p start_station = start_station
    puts "\nend_line"
    p end_line      = end_line.downcase.to_sym
    puts "\nend_station"
    p end_station   = end_station

    start_station_index = @subway_lines[start_line].stations.index do |station|
      puts "\n#{station.name} == #{start_station}"
      p station.name.downcase == start_station.downcase
    end

    end_station_index = @subway_lines[end_line].stations.index do |station|
      puts "\n#{station.name} == #{end_station}"
      p station.name.downcase == end_station.downcase
    end

    puts "\nstart_station_index"
    p start_station_index
    puts "\nend_station_index"
    p end_station_index

    if (start_line == end_line)
      total_stops = (start_station_index - end_station_index).abs
      puts "\ntotal_stops"
      return p total_stops
    end

    start_line_park_street_index = @subway_lines[start_line].stations.index do |station|
      puts "\n#{station.name} == Park Street"
      p station.name == "Park Street"
    end

    end_line_park_street_index = @subway_lines[end_line].stations.index do |station|
      puts "\n#{station.name} == Park Street"
      p station.name == "Park Street"
    end

    puts "\nstart_line_park_street_index"
    p start_line_park_street_index
    puts "\nend_line_park_street_index"
    p end_line_park_street_index

    stops_until_park_street = (start_station_index - start_line_park_street_index).abs
    stops_until_destination = (end_station_index - end_line_park_street_index).abs

    puts "\nstops_until_park_street"
    p stops_until_park_street
    puts "\nstops_until_destination"
    p stops_until_destination

    total_stops = stops_until_park_street + stops_until_destination
    puts "\ntotal_stops"
    return p total_stops
  end

end

# One line, all the stations on that line
class Line

  attr_accessor :name, :stations

  def initialize(name, stations)
    @name     = name
    @stations = stations.map do |station|
      Station.new(station)
    end
  end

end

# One station
class Station

  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

mbta = Subway.new

# mbta.stops_between_stations("Red", "Alewife", "Red", "Alewife") # 0
# mbta.stops_between_stations("Red", "Alewife", "Red", "South Station") # 7
mbta.stops_between_stations("Red", "South Station", "Green", "Kenmore") # 6
# mbta.stops_between_stations("Orange", "Forest Hills", "Green", "Kenmore") # 10