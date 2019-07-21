
class Subway
  attr_reader :red, :green, :orange

  def initialize
    ## Subway class will call and initialize the 3 lines we want by creating a new object of the "line" class for each line, passing an array of stations as a param
    @red = Line.new("red", ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])
    @green = Line.new("green", ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])
    @orange = Line.new("orange", ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
  end

  def stops_between_stations(start_line, start_station, end_line, end_station)

    ## This changes the line from a string to the instance variable of the line (i.e "red" turns into @red)
    start_line = self.instance_variable_get("@#{start_line}")
    end_line = self.instance_variable_get("@#{end_line}")

    results = 0
    puts "Rider boards the train a #{start_line.line_name} Line and #{start_station}."
    if start_line === end_line
      results = start_line.one_line(start_station, end_line)
    else
      results = start_line.one_line(start_station, "Park Street")
      puts "Rider transfers from #{start_line.line_name} Line to #{end_line.line_name} Line at Park Street."
      results += end_line.one_line("Park Street", end_station)
    end
    puts "Rider exits the train a #{end_line.line_name} Line and #{end_station}. \n#{results} stops in total!"
  end
end

class Line
  attr_reader :stations, :line_name

  def initialize(line_name, stations)
    ## the line class goes through a loop of all the stations that came through the parameter and creates an object for each station with the name attriubute 
    @stations = stations.map { |station| Station.new(station) }
    @line_name = line_name
  end

  def station_index(name)
    ## this method returns the index of the station 
    return @stations.select.with_index { |station, i| return i if station.name == name }
  end

  def one_line(start_station, end_station)
    ## this is the one line method
    start_index = self.station_index(start_station)
    end_index = self.station_index(end_station)
    counter = 0
    until start_index == end_index
      if start_index < end_index
        start_index += 1
      else
        start_index -= 1
      end
      puts "Rider arrives at #{self.line_name} Line and #{self.stations[start_index].name}"
      counter += 1
    end
    return counter
  end
end

class Station
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mbta = Subway.new
mbta.stops_between_stations("red", "Alewife", "green", "Hynes") 
