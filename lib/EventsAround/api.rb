class EventsAround::API
    def self.fetch(city)
        key = "wyUof2RN2abCcq4KezWze9IaXXjOiIgd"
        url = "https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&apikey=#{key}"
        response = HTTParty.get(url)

        if city != "" && response["_embedded"]
            response["_embedded"]["events"].each do |event|
            name = event["name"]
            event_url = event["url"]
                info = event["info"]
                date = event["dates"]["start"]["localDate"]
                time = event["dates"]["start"]["localTime"]
                venue = event["_embedded"]["venues"][0]["name"]
                address = Array.new 
                address << event["_embedded"]["venues"][0]["address"]["line1"] << event["_embedded"]["venues"][0]["city"]["name"] << event["_embedded"]["venues"][0]["state"]["stateCode"] << event["_embedded"]["venues"][0]["postalCode"]
             EventsAround::Event.new(name, event_url, info, date, time, venue, address)
            end
        else
            puts "ERROR: Could not find the city. Please check the spelling or enter another city:"
            new_input = gets.chomp
            self.fetch(new_input)
        end
    end
end


