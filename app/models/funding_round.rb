# require_relative "startup"
# require_relative "venture_capitalist"

class FundingRound
    attr_reader :startup, :venture_capitalist, :type
    attr_accessor :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        if investment.class == Float && investment > 0 
            @startup = startup
            @venture_capitalist = venture_capitalist
            @type = type
            @investment = investment
            @@all << self
        end
    end

    def self.all
        @@all
    end
    
end


