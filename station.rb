class Station
    attr_accessor :station
    def initialize(station)
        @station=station
    end

    def getS
        return @station
    end
end