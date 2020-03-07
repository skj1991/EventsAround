class EventsAround::Event
    @@all = []
    attr_accessor :name
    #creating attributes from the data gathered such as: name, date, venue
    #really confused about this entire class!!!

    def initialize(name)
        #should events be initialized with the instance of the API??
        @name = name
        save
    end

    def self.all
        input = gets.chomp
        @@all << EventsAround::API.new.fetch(input) if @@all.empty?
        @@all
        # pushing gathered events into an array
        #why wouldnt this be in the initialize method??
    end

    def save
        @@all << self
    end
end