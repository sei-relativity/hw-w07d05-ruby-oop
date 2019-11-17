class Station
  def initialize
  @lines = {
  "Red"=>["South Station", "Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
  "Green"=> ["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
  "Orange"=> ['North Station',"Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"]
}
  end

  def stops_in_same_station(first_stop,last_stop,line)
  first_location = @lines[line].index(first_stop)
  last_location = @lines[line].index(last_stop)
  number_of_stops = (first_location - last_location).abs
  end
end


class Line < Station
def stops_in_diffirent_statoins(first_station,first_stop, last_station, last_stop) 

  distance_to_intersect = stops_in_same_station(first_stop,"Park Street", first_station)
  distance_from_intersect = stops_in_same_station('Park Street',last_stop, last_station)

  total_distance = distance_to_intersect + distance_from_intersect
  puts "The total distance for the whole trip is : #{total_distance}"
  
end
end





class Subway < Line
  def initialize
    @lines = {
  "Red"=>["South Station", "Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
  "Green"=> ["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
  "Orange"=> ['North Station',"Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"]
}
  end


  def stops_between_stations(first_station,first_stop, last_station, last_stop)

  if first_station == last_station
    distance = stops_in_same_station(first_stop, last_stop, first_station)
      puts "The total distance for the whole trip is : #{distance}"
  else 
    stops_in_diffirent_statoins(first_station,first_stop, last_station, last_stop)
  end

end





end



mbta = Subway.new


mbta.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
mbta.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
mbta.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6