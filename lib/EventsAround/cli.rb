class EventsAround::CLI
    def call
        puts "Welcome to EventsAround! Where would you like to search? Please enter your State (ex. for California enter: CA):"
        input = gets.chomp
        EventsAround::API.new.fetch(input)
        user_selection
    end

    def user_selection #asks user to select event
        puts "Please enter the number of the event you want more information about:"
        chosen_event = gets.chomp
        event_details_for(chosen_event) if valid_input(chosen_event, @events)
    end

    def valid_input(input, data)

    end

    def event_details_for(chosen_event)

    end
end