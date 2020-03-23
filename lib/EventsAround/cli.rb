class EventsAround::CLI
    def call 
        puts "-------------------------"
        puts "Welcome to EventsAround!" 
        puts "Enter a city where would you like to search events..(ex. New York City):"
        puts "-------------------------"
        input = gets.chomp
        EventsAround::API.fetch(input)
        puts "-------------------------"
        sleep(2)
        list_events
        user_selection
        puts "-------------------------"
        sleep(2)
        loop_or_exit
    end

    def list_events
        EventsAround::Event.sort_by_date.each.with_index(1) do |event, index|
        puts "#{index}. #{event.name}"
        end
    end 

    def user_selection 
        puts "-------------------------"
        puts "Enter the number corresponding to the event you want more information about:"
        puts "-------------------------"
        input = gets.chomp.to_i
        index = input - 1
        if input < EventsAround::Event.all.length && input > 0
         chosen_event = EventsAround::Event.all[index]
         puts "-------------------------"
         sleep(1)
            puts "Event: #{chosen_event.name}" 
            puts "Date: #{chosen_event.date}"
            puts "Time: #{chosen_event.time}"
            puts "Venue: #{chosen_event.venue}"
            puts "Address: #{chosen_event.address}"
            puts "Info: #{chosen_event.info}"
            puts "Buy tickets: #{chosen_event.event_url}"
        else 
           puts "INVALID ENTRY: Your entry does not match any of the listed options. Please enter the number next to the corresponding event you would like more details about."
           user_selection
        end
    end

    def loop_or_exit
        puts "Would you like to...?"
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
            EventsAround::Event.all.clear
            call
        elsif input == "c"
            puts "-------------------------"
            puts "Thank you for using Events Around!"
            puts "-------------------------"
            exit
        else
            puts "-------------------------"
            puts "INVALID ENTRY: Choose from the listed options by entering the corresponding letter."
            puts "-------------------------"
            loop_or_exit
        end
    end
end