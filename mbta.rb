class Subway	
    attr_reader :red, :green, :orange	
  
    
    def initialize	
      @red = Line.new("red", ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"])	
      @green = Line.new("green", ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])	
      @orange = Line.new("orange", ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])	
    end	
  
    def stops_between_stations(start_line, start_station, end_line, end_station)	
      start_line = self.instance_variable_get("@#{start_line}")	
      end_line = self.instance_variable_get("@#{end_line}")	
  
      results = 0	

      if start_line === end_line	
        results = start_line.one_line(start_station, end_line)

      else	
        results = start_line.one_line(start_station, "Park Street")	
        results += end_line.one_line("Park Street", end_station)	
      end	

      puts results
    end	
  end	
  
  class Line	
    
    attr_reader :stations, :line_name	
  
    def initialize(line_name, stations)
      @stations = stations.map { |station| Station.new(station) }	
      @line_name = line_name

    end	
  
    def station_index(name)		
      return @stations.select.with_index { |station, i| 
        return i if station.name == name }	
    end	
  
    def one_line(start_station, end_station)
      start_index = self.station_index(start_station)	
      end_index = self.station_index(end_station)	

      counter = 0
      until start_index == end_index	

        if start_index < end_index	
          start_index += 1	
        else	
          start_index -= 1	
        end	

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