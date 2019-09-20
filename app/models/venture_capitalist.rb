class VentureCapitalist

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end
    def self.all
        @@all
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist == self}
    end

    def total_worth
        #returns number of net worth
        #map the array of rounds into an array of investment then sum that array
        investment_array = self.funding_rounds.map{|round| round.investment}
        total = investment_array.sum
    end

    def self.tres_commas_club 
        self.all.select{|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def portfolio
        startups_array = self.funding_rounds.map{|round| round.startup}
        startups_array.uniq
    end

    def biggest_investment
        self.funding_rounds.max{|round1, round2| round1.investment <=> round2.investment}
    end

    def invested(domain_str)
        # given a domain string, returns the total amount invested in that domain
        domain_array = self.funding_rounds.select{|round| round.startup.domain == domain_str}
        investment_array = domain_array.map{|round| round.investment}
        investment_array.sum

    end
end
