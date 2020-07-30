require 'pry'
require 'httparty'

class API


    # key = "c3a09436c36df61cfcf77bb566836dbb"

    def self.get_movies(movie_name)
        # key = "c3a09436c36df61cfcf77bb566836dbb"
        response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=c3a09436c36df61cfcf77bb566836dbb&query=#{movie_name}")
        movie_hash = {}
        movie_hash[:overview] = response["results"][0]["overview"]
        movie_hash[:title] = response["results"][0]["title"]
        movie_hash[:score] = response["results"][0]["vote_average"]
        binding.pry
    end
    
end

new = API.get_movies("batman")
new