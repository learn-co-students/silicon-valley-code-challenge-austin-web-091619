require_relative 'startup'
require_relative 'funding_round'

class VentureCapitalist

    attr_reader :name, :total_worth, :funding_rounds, :biggest_investment

    @@all = []

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @funding_rounds = []
        @portfolio = []
        @biggest_investment = 0
        @invested = 0

        @@all << self
    end

    def offer_contract (startup, type, investment)
        @portfolio << startup
        @invested += investment
        if investment > @biggest_investment
            @biggest_investment = investment
        end

        fundingRound = FundingRound.new(startup, self, type, investment)
        @funding_rounds << fundingRound
        fundingRound
    end

    def portfolio
        @portfolio.uniq
    end

    def invested (domain)
        "#{domain} #{@invested}"
    end


    # CLASS METHODS BELOW

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select { |vc| vc.total_worth >= 1000000000 }
    end

end

# TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
# TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
# TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST

joey = VentureCapitalist.new("Joey", 123123)
oscar = VentureCapitalist.new("Oscar", 100000000000000)
stefan = VentureCapitalist.new("Stefan", 100000000000000)

puts VentureCapitalist.tres_commas_club