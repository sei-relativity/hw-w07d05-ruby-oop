class Line
    
    def initialize(station)
      @station=station
      @available_stations=[]
    end
    
    def add_station (new_station)
      station = Station.new(new_station)
      @available_stations << station.get
    end
    
    def number_of_stops(start_station,end_station)
      (@available_stations.index(start_station)-@available_stations.index(end_station)).abs()
    end

end