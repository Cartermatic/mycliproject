class Movie

    attr_accessor :title, :overview, :score

    def initialize(movie)
        movie.each {|key, value| self.send({"#{key}="}, value)
        @@all << self        
    end

    


end

