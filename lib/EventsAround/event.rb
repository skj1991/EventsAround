class EventsAround::Event
    attr_accessor :name, :event_url, :info, :date, :time, :venue, :address
    @@all = []

    def initialize(name, event_url, info, date, time, venue, address)
        @name = name
        @event_url = event_url
        @info = info
        @date = date
        @time = time
        @venue = venue
        @address = address.join(", ")
        @@all << self
    end

    def self.all
        @@all
    end
end