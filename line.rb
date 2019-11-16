class Line
    attr_accessor :line
    def initialize(line)
        @line=line
        @free_st=[]
    end

    def add_line(newline)
        line = line.new(newline)
        @free_st << Station.getS
    end
end