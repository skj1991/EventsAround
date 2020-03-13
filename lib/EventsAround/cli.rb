class EventsAround::CLI
    def call 
        puts <<-REST
        Welcome to EventsAround! 
        Where would you like to search? Please enter a city..(ex. New York City or New York City, NY):
        -------------------------
        REST
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
        EventsAround::Event.all.each.with_index(1) do |event, index|
        puts "#{index}. #{event.name}"
        end
    end 

    def user_selection 
        puts "Please enter the number corresponding to the event you want more information about:"
        puts "-------------------------"
        input = gets.chomp.to_i
        index = input - 1
        if input < EventsAround::Event.all.length && input > 0
         chosen_event = EventsAround::Event.all[index]
         puts "-------------------------"
         sleep(1)
         puts <<-REST 
            Event: #{chosen_event.name} 
            Date: #{chosen_event.date}
            Time: #{chosen_event.time}
            Venue: #{chosen_event.venue}
            Address: #{chosen_event.address}
            Info: #{chosen_event.info}
            Buy tickets: #{chosen_event.event_url}
            REST
        else 
           puts "Your entry does not match any of the listed options. Please enter the number next to the corresponding event you would like more details about."
           user_selection
        end
    end

    def loop_or_exit
        puts <<-REST
        Would you like to...
        a. Choose another event
        b. Search another city
        c. Exit program
        -------------------------
        REST
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
            exit
        else
            puts <<-REST
            -------------------------
            Invalid entry! Please choose from the listed options by entering the corresponding letter.
            -------------------------
            REST
            loop_or_exit
        end
    end
end