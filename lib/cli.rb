require 'pry'

class CLI

    def call     
        movie_time_image
        welcome_greeting
        ask_for_movie
    end


    def movie_time_image
        puts " "
        puts '   ___  ___           _        _____ _                 '
        puts '   |  \/  |          (_)      |_   _(_)                '
        puts '   | .  . | _____   ___  ___    | |  _ _ __ ___   ___  '
        puts '   | |\/| |/ _ \ \ / / |/ _ \   | | | | `_ ` _ \ / _ \ '
        puts '   | |  | | (_) \ V /| |  __/   | | | | | | | | |  __/ '
        puts '   \_|  |_/\___/ \_/ |_|\___|   \_/ |_|_| |_| |_|\___| '
        puts " "                                                       
    end

#1
    def welcome_greeting
        puts " "
        puts "Hey there! Thanks for using my film searching program, Movie Time!"
        puts " "
        puts "Just search for a film and I will do my best to give you some quick information about it!"
        puts " "
    end
#3
    def get_movie(movie_name)
        response = API.get_movie(movie_name)
        if response
            new_movie = Movie.new(response)
            list_options
            get_input_of_options(new_movie)
        else
            puts " "
            puts "Hey you! That is not a real movie!"
            puts " "
            ask_for_movie
        end
        loop_back_to_movie_search
    end
#4
    def list_options
        puts " "
        puts "Choose one to learn more information regarding the movie you have chosen!"
        puts " "
        puts "1. A short synopsis."
        puts "2. The IMDB score of the film."
        puts " "   
    end
#5
    def get_input_of_options(new_movie)

        user_input = gets.strip

        if user_input == "1"
            puts " "
           puts new_movie.overview
        elsif user_input == "2"
            puts " "
           puts new_movie.score
        else
            puts "Incorrect input! Please enter 1 or 2."
            get_input_of_options(new_movie)    
        end
    end
#2
    def ask_for_movie
        puts " "
        puts "When you are ready friend, simply type in a movie name and hit enter, I will do the rest!"
        puts " "
        puts "In fact, why don't you pop some popcorn right now as well? Movie Time makes learning about movies easy!"
        puts " "

        user_input = gets.strip

        if Movie.find_by_title(user_input)
            find_by_title
        else
            get_movie(user_input)
        end
    end

    def loop_back_to_movie_search
        puts " "
        puts "Hey friend, wanna search another movie?"
        puts "Just tell me what movie so I can help you out!"
        puts " "
        puts "If you are finished and would like to exit the program, simply type exit."

        user_input = gets.strip

        if user_input == "exit" || user_input == "Exit"
            abort "\nThank you for using Movie Time! Enjoy your movie!\n"
        elsif Movie.find_by_title(user_input)
            find_by_title
        else
            get_movie(user_input)
        end    
    end
end