
class Movie

    attr_accessor :title, :overview, :score
    @@all = []

    def initialize(movie)
        movie.each {|key, value| self.send("#{key}=", value)}
        @@all << self        
    end

    def self.all
        @@all
    end

    def self.find_by_title(title)
        self.all.detect do |movie|
            movie.title == title
        end
    end

    def self.create_from_collection(movies)
        movies.each {|movie| self.new(movie)}
    end


end

