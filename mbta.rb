 class Subway	  
      attr_accessor :red, :green, :orange
      attr_reader :line
      def initialize (line)
        @line= line
      end
    
      def stops_between_stations(start_line, start_station, end_line, end_station)
        line = 
          @red= Line.new  ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"]
          @green= Line.new (["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"])
          @orange= Line.new ( ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"])
        
      end

    
        total_stop=0
        start_stop = start_line.index(start_station)
        end_stop = end_line.index(end_station)
    
            if start_stop <= end_stop
                for i in start_stop end_stop do
            total_stop = total_stop +1
                end
                puts total_stop 
    
    else
    
        for i in end_stop start_stop do
                total_stop = total_stop +1
            end
                puts total_stop   
        end
    end 



class Line < Subway
    attr_reader :stations
    attr_reader :name
  
    def initialize(name, stations)
      @name, @stations= name, stations # order important!
  
    end
end


class Station < Subway

    attr_reader :station
    def initialize(station)
      @station = station
    end
end
  
mbta = Subway.new
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station')