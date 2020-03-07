class EventsAround::API
    def fetch(state)
        key = "wyUof2RN2abCcq4KezWze9IaXXjOiIgd"
        url = "https://app.ticketmaster.com/discovery/v2/events.json?stateCode=#{state}&apikey=#{key}"
        # change from postalCode= to city= which accepts an array
        response = HTTParty.get(url)
        response["_embedded"]["events"].each.with_index(1) do |event, index|
            puts "#{index}. #{event["name"]}"
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


