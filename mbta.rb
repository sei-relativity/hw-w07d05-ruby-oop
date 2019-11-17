
# One station
class Station
  def initialize
    @subway = {
      "Red" => ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"],
      "Green" => ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"],
      "Orange" => ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"],
    }
  end
end

# One line, all the stations on that line
class Line < Station
  def print_one_line(line, station_a, station_b)
    @start_station = @subway[line].index(station_a)
    @end_station = @subway[line].index(station_b)
    @count = (@end_station - @start_station).abs

    if (@start_station < @end_station)
      return @subway[line].slice(@start_station, @end_station)
    elsif @start_station > @end_station
      return @subway[line].slice(@end_station, @start_station).reverse
    else return []     end
  end
end

class Subway < Line
  def stops_between_stations(start_line, start_station, end_line, end_station)
    @stops = 0
    if start_line == end_line
      p "You must travel through the following stops on the #{start_line} line:"
      @arr = print_one_line(start_line, start_station, end_station)
      @stops = @arr.length
      p @arr.join(" and ")
    else
      p "You must travel through the following stops on the #{start_line} line:"
      @arr = print_one_line(start_line, start_station, "Park Street")
      @stops = @arr.length
      p @arr.join(" and ")

      p "Change at Park Street."

      p "Your trip continues through the following stops on #{end_line} Line:"
      @arr = print_one_line(end_line, "Park Street", end_station)
      @stops += @arr.length
      p @arr.join(" and ")
    end
    p "#{@stops}stops in total."
  end
end

mbta = Subway.new
mbta.stops_between_stations("Red", "South Station", "Green", "Kenmore")
