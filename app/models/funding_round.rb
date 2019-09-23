class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment
    @@all = []

    def initialize(startup, venture_cap, type, investment)
        
        
        @@all << self
        investment *= 1.0
        if investment < 0 || investment.class == Float
            @investment = investment
            @startup = startup
            @venture_capitalist = venture_cap
            @type = type
        end

    end

    def self.all
        @@all
    end




end
