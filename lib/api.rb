
class API


    @@key = "c3a09436c36df61cfcf77bb566836dbb"

    def self.get_movie(movie_name)
        
        response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{@@key}&query=#{movie_name}")
        if response["results"].length > 0
        movie_hash = {}
        movie_hash[:overview] = response["results"][0]["overview"]
        movie_hash[:title] = response["results"][0]["title"]
        movie_hash[:score] = response["results"][0]["vote_average"]
        movie_hash
        else 
            false
        end
    end

end

# new = API.get_movie("batman")
# puts new

