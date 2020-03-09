class EventsAround::API
    def self.fetch(state)
        key = "wyUof2RN2abCcq4KezWze9IaXXjOiIgd"
        url = "https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{state}&apikey=#{key}"
        # change from postalCode= to city= which accepts an array
        response = HTTParty.get(url)
        response["_embedded"]["events"].each do |event|
            name = event["name"]
            date = event["dates"]["start"]["localDate"]
            time = event["dates"]["start"]["localTime"]
            venue = event["_embedded"]["venues"][0]["name"]
            address = event["_embedded"]["venues"][0]["address"]["line1"]
            EventsAround::Event.new(name, date, time, venue, address)
        end
    end

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    #def fetch_details(state)
    #    key = "wyUof2RN2abCcq4KezWze9IaXXjOiIgd"
    #    url = "https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{state}&apikey=#{key}"
    #    # change from postalCode= to city= which accepts an array
    #    response = HTTParty.get(url)
    #    response["_embedded"]["events"].each do |event|
    ##        puts event["dates"]
    #   end
    #    binding.pry
    #end
end


