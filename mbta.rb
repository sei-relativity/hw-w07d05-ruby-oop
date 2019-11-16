require './station'
require './line'

class Subway
    attr_accessor :myLines

    def initalize(myLines)
        @myLines=[]
    end

    def stops_between_stations(sLine, sStation, eLine, eStation)
        
        return (@myLines[sLine.to_sym].index(sStation) - @myLines[eLine.to_sym].index(eStation).abs()) if sLine==eLine
        
        ((@myLines[(sLine.downcase).to_sym].index(sStation) - @myLines[(sLine.downcase).to_sym].index("Park Street")).abs() ) + ((@myLines[(eLine.downcase).to_sym].index("Park Street") - @myLines[(eLine.downcase).to_sym].index(eStation)).abs() )
    end

    def add_line(nline)
        line=Line.new(nline)
        @myLines[nline.to_sym]= line
    end

    def get_line(nline)
        @myLines[nline.to_sym]
    end
end

lines = {
            red:[ "South Station","Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"],
             green:["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"],
              Orange:["North Station","Haymarket","Park Street","State","Downtown Crossing","Chinatown","Back Bay","Forest Hill"]
        }
        
mbta = Subway.new
   lines.each do |newLine, newStation|
        mbta.add_line(newLine.to_s)
   newStation.each do |station|
        mbta.get_line(newLine).add_station(newStation)
    end
end

# p stops_between_stations('red', 'Alewife', 'red', 'Alewife')
# p stops_between_stations('red', 'Alewife', 'red', 'South Station')
p stops_between_stations('red', 'South Station', 'green', 'Kenmore')