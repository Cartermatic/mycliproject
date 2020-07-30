class Movie

    attr_accessor :title, :overview, :score

    def initialize(movie)
        movie.each {|key, value| self.send({"#{key}="}, value)
        @@all << self        
    end

    def self.all
        @@all
    end

 

end

