class Subway
    attr_accessor :stations;
    def initialize
        @stations = {
            red: ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'porter', 'Davis', 'Alewife'],
            green: ['Goverment Center', 'Park Street','biylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'],
            orange: ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back bay', 'Forest Hills']
        }
    end

    def stops_between_stations(start_line, start_station, end_line, end_station)
        @start_line = Line.new(start_line, start_station)
        @end_line = Line.new(end_line, end_station)
        @start_station = Station.new(start_station)
        @end_station = Station.new(end_station)

        @index_start_station = @stations[@start_line.line.to_sym].index(@start_station.station)
        @index_end_station = @stations[@end_line.line.to_sym].index(@end_station.station)
        @index_of_park_Street_first =  @stations[@start_line.line.to_sym].index('Park Street')
        @index_of_park_Street_second =  @stations[@end_line.line.to_sym].index('Park Street')

        if (@start_line.line == @end_line.line)
            result = (@index_start_station - @index_end_station).abs
            return "total steps: #{result}"
        end

        @first_journy = (@index_start_station - @index_of_park_Street_first).abs
        @second_journy = (@index_end_station - @index_of_park_Street_second).abs

        return @first_journy + @second_journy
    end
end  
# One line, all the stations on that line
class Line
    attr_accessor :line, :station;
    def initialize(line, station)
        @line = line
        @station = Station.new(station)
    end
end

# One station
class Station
    attr_accessor :station;
    def initialize(station)
        @station = station
    end
end

mbta = Subway.new
puts mbta.stops_between_stations('red', 'Alewife', 'red', 'Alewife')
puts mbta.stops_between_stations('red', 'Alewife', 'red', 'South Station')
puts mbta.stops_between_stations('red', 'South Station', 'green', 'Kenmore') 