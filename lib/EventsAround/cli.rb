class EventsAround::CLI
    def call
        puts "Welcome to EventsAround! Where would you like to search? Please enter your State (ex. for California enter: CA):"
        list_events
        user_selection
    end

    def list_events
        @events = EventsAround::Event.all
    end 

    def user_selection #asks user to select event
        puts "Please enter the number of the event you want more information about:"
        chosen_event = gets.chomp.to_i
        event_details_for(chosen_event) if valid_input(chosen_event, @events)
    end

    def valid_input(input, data) #confirms that user input is valid give the data
        input.to_i <= data.length && input.to_i > 0
    end

    def event_details_for(chosen_event)#show event details(date and venue) of the users selection
        event = @events[chosen_event - 1]
        puts "Here are the details for:"
    end
end