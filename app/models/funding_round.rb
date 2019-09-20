class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment
    @@all = []

    def initialize(startup, venture_cap, type, investment)
        @startup = startup
        @venture_capitalist = venture_cap
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end




end
