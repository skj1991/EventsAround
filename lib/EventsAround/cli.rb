class EventsAround::CLI
    def call
        puts "Welcome to EventsAround! Where would you like to search? Please enter zipcode:"
        input = gets.chomp
        EventsAround::API.new.fetch(input)
    end
end