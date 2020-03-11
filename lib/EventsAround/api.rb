class EventsAround::API
    def self.fetch(city)
        key = "wyUof2RN2abCcq4KezWze9IaXXjOiIgd"
        url = "https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&apikey=#{key}"
        # change from postalCode= to city= which accepts an array
        response = HTTParty.get(url)
        response["_embedded"]["events"].each do |event|
            name = event["name"]
            date = event["dates"]["start"]["localDate"]
            time = event["dates"]["start"]["localTime"]
            venue = event["_embedded"]["venues"][0]["name"]
            address = Array.new
            address << event["_embedded"]["venues"][0]["address"]["line1"] << event["_embedded"]["venues"][0]["city"]["name"] << event["_embedded"]["venues"][0]["state"]["stateCode"] << event["_embedded"]["venues"][0]["postalCode"]
            #address.join(", ")
            #binding.pry
            #address << event["_embedded"]["venues"][0]["city"]["name"]
            #address << event["_embedded"]["venues"][0]["state"]["stateCode"]
            #address << event["_embedded"]["venues"][0]["postalCode"]
            #address = event["_embedded"]["venues"][0]["address"]["line1"]
            #can i make it an empty array and shovel in the information needed??
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


