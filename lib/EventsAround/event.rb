class EventsAround::Event
    attr_accessor :name, :date, :time, :venue, :address
    @@all = []

    def initialize(name, date, time, venue, address)
        @name = name
        @date = date
        @time = time
        @venue = venue
        @address = address.join(", ")
        @@all << self
        #binding.pry
    end

    def self.all
        @@all
    end
end