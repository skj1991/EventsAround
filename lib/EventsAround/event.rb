class EventsAround::Event
    attr_accessor :name, :date, :time, :venue, :address
    @@all = []

    def initialize(name, date, time, venue, address)
        #should events be initialized with the instance of the API??
        @name = name
        @date = date
        @time = time
        @venue = venue
        @address = address
        @@all << self
    end

    def self.all
        @@all
    end
end