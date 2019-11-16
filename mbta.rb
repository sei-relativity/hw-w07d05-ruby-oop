class Subway
    def initialize
      @available_lines={}
    end
    def add_line(nline)
      line=Line.new(nline)
      @available_lines[nline.to_sym]= line
    end
    def stops_between_stations(start_line, start_station, end_line, end_station)
      return @available_lines[start_line.to_sym].number_of_stops(start_station,end_station) if start_line== end_line
      @available_lines[start_line.to_sym].number_of_stops(start_station,'Park Street')+@available_lines[end_line.to_sym].number_of_stops(end_station,'Park Street')
    end
    def get_line(nline)
      @available_lines[nline.to_sym]
    end
  end
    
  # One line, all the stations on that line
  class Line
    def initialize(name)
      @name=name
      @available_stations=[]
    end
    def add_station (nstation)
      station = Station.new(nstation)
      @available_stations << station
    end
    def number_of_stops(start_station,end_station)
      (@available_stations.index(@available_stations.detect { |station| station.get == start_station})-@available_stations.index(@available_stations.detect { |station| station.get == end_station})).abs()
    end

  end
  
  # One station
  class Station
    def initialize(name)
      @name=name
    end
    def get
      return @name
    end
  end
  stations={Red:[ "South Station","Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"], Green:["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"], Orange:["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hill"]}

mbta = Subway.new
stations.each do |nline, nstations|
  mbta.add_line(nline.to_s)
  nstations.each do |nstation|
    mbta.get_line(nline).add_station(nstation)
  end
end


  p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife')
  p mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station')
  p mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') 