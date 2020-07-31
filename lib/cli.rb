require 'pry'

class CLI




# def movie_time_image

# puts " "
# puts '   ___  ___           _        _____ _                 '
# puts '   |  \/  |          (_)      |_   _(_)                '
# puts '   | .  . | _____   ___  ___    | |  _ _ __ ___   ___  '
# puts '   | |\/| |/ _ \ \ / / |/ _ \   | | | | '_ ` _ \ / _ \ '
# puts '   | |  | | (_) \ V /| |  __/   | | | | | | | | |  __/ '
# puts '   \_|  |_/\___/ \_/ |_|\___|   \_/ |_|_| |_| |_|\___| '
# puts " "                                                       
# end

# movie_time_image

    def welcome_greeting
        puts "Hey there! Thanks for using my film searching program, Movie Time!"
        puts " "
        puts "Just search for a film and I will do my best to give you some quick information about it!"
        puts " "
    end

    def get_movie(movie_name)
        response = API.get_movie(movie_name)
        if response
        new_movie = Movie.new(response)
        list_options
        get_input_of_options(new_movie)
        else
            puts "Hey you! That is not a real movie!"
            ask_for_movie
        end
    end

    def list_options
        puts "Choose one to learn more information regarding the movie you have chosen!"
        puts "1. A short synopsis."
        puts "2. The IMDB score of the film."
    
    end

    def get_input_of_options(new_movie)
        user_input = gets.strip
        if user_input == "1"
            new_movie.overview
        elsif user_input == "2"
            new_movie.score
        else
            puts "Incorrect input! Please enter 1 or 2."
            get_input_of_options(new_movie)    
        end
    end

    # def ask_for_movie
    #     puts "When you are ready friend, simply type in a movie name and hit enter, I will do the rest!"
    #     puts " "
    #     puts "In fact, why don't you pop some popcorn right now as well? Movie Time makes learning about movies easy!"
    #     puts " "
    #     user_input = gets.strip
    #     if Movie.find_by_title(user_input)
    #     get_movie(user_input)

    # end

# method that grabs movie name in local variable
# if and else to check whether movie name is valid, if not else statment is an error message
#     once checked if valid call in another method that calls in api class


end