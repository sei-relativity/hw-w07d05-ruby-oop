require './station'
require './line'

class Subway

    def initialize
        @lines={}
    end

    def add_line(new_line)
      line=Line.new(new_line)
      @lines[new_line.to_sym]= line
    end

    def stop_between_stations(start_line, start_station, end_line, end_station)
      return @lines[start_line.to_sym].number_of_stops(start_station,end_station) if start_line== end_line
      @lines[start_line.to_sym].number_of_stops(start_station,'Park Street')+@lines[end_line.to_sym].number_of_stops(end_station,'Park Street')
    end
    
    def get_line(new_line)
      @lines[new_line.to_sym]
    end
end

stations={
    Red:[ "South Station","Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"], 
    Green:["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"], 
    Orange:["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hill"]
}

mbta = Subway.new
    stations.each do |new_line, nstations|
        mbta.add_line(new_line.to_s)
    nstations.each do |nstation|
        mbta.get_line(new_line).add_station(nstation)
        end
    end

puts mbta.stop_between_stations('Red', 'Alewife', 'Red', 'Alewife')