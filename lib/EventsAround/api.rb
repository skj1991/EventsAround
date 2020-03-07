class EventsAround::API
    def fetch(postalcode)
        key = "wyUof2RN2abCcq4KezWze9IaXXjOiIgd"
        url = "https://app.ticketmaster.com/discovery/v2/events.json?postalCode=#{postalcode}&apikey=#{key}"
        response = HTTParty.get(url)
        response["_embedded"]["events"].each do |event|
            puts event["name"]
        end
    end
end