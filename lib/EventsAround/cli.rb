class EventsAround::CLI
    def call
        puts "Welcome to EventsAround! Where would you like to search? Please enter your State (ex. for California enter: CA):"
        input = gets.chomp
        EventsAround::API.fetch(input)
        list_events
        user_selection
    end

    def list_events
        EventsAround::Event.all.each.with_index(1) do |event, index|
        puts "#{index}. #{event.name}"
        end
    end 

    def user_selection 
        puts "Please enter the number of the event you want more information about:"
        input = gets.chomp.to_i
        index = input - 1
        chosen_event = EventsAround::Event.all[index]
        puts "Date: #{chosen_event.date}"
        puts "Time: #{chosen_event.time}"
        puts "Venue: #{chosen_event.venue}"
        puts "Address: #{chosen_event.address}"
        #do i have to put out each one or is there a cleaner way to write this it of code?
    end

    #def valid_input(input, data) #confirms that user input is valid give the data
    #    input.to_i <= data.length && input.to_i > 0
    #end
end