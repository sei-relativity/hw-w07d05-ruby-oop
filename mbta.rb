class Subway
    attr_accessor :lines
    def initialize
 @subway_line = {
        Red:["South Station","Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"],
        Green:["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
        Orange:["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hills"]
    }
end
    def stops_between_stations(start_line, start_station, end_line, end_station)
            start_station1 = @mbta[start_line.to_sym].index(start_station)
            end_station1 = @mbta[start_line.to_sym].index('Park Street')
            line1 = (start_station1 - end_station1).abs
            start_station2 = @mbta[end_line.to_sym].index('Park Street')
            end_station2 = @mbta[end_line.to_sym].index(end_station)
            line2 = (start_station2 - end_station2).abs
            
            puts lines=line1+line2
    end
end