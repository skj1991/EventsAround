class EventsAround::CLI
    def call #add error handling
        puts "Welcome to EventsAround! Where would you like to search? Please enter a city (ex. New York City or Atlanta):"
        input = gets.chomp
        EventsAround::API.fetch(input)
        list_events
        user_selection
        puts "-------------------------"
        sleep(2)
        loop_or_exit
    end

    def list_events
        EventsAround::Event.all.each.with_index(1) do |event, index|
        puts "#{index}. #{event.name}"
        end
    end 

    def user_selection #add error handling
        puts "Please enter the number of the event you want more information about:"
        input = gets.chomp.to_i
        index = input - 1
        chosen_event = EventsAround::Event.all[index]
        puts "-------------------------"
        sleep(1)
        puts "Date: #{chosen_event.date}"
        puts "Time: #{chosen_event.time}"
        puts "Venue: #{chosen_event.venue}"
        puts "Address: #{chosen_event.address}"
        #do i have to put out each one or is there a cleaner way to write this it of code?
    end

    def loop_or_exit #add error handling/invalid input
        puts "Would you like to..."
        puts "a. Choose another event"
        puts "b. Search another city"
        puts "c. Exit program"
        puts "-------------------------"
        input = gets.chomp.downcase
        if input == "a"
            list_events
            user_selection
            sleep(2)
            puts "-------------------------"
            loop_or_exit
        elsif input == "b"
            call
        elsif input == "c"
            exit
        else
            puts "-------------------------"
            puts "Invalid entry! Please choose from the listed options by entering the corresponding letter."
            puts "-------------------------"
            loop_or_exit
        end
    end
end