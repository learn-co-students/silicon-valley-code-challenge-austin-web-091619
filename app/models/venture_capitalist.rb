require_relative "startup"
require_relative "funding_round"

class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []
    @@tres_commas_club = []

    def initialize(name, total_worth)
        @name =  name
        @total_worth = total_worth
        @@all << self
        @@tres_commas_club << self

    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select{ |instance| instance.total_worth > 1000000000  }
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        all_funding_rounds = FundingRound.all
        my_rounds = all_funding_rounds.select{ |round| round.venture_capitalist == self}
        my_rounds
    end

    def portfolio
        my_rounds = funding_rounds
        my_companies = my_rounds.map{|round| round.startup }
        my_companies = my_companies.map{|startup| startup.name }.uniq
    end

    def biggest_investment
        my_investments = funding_rounds
        max_round = my_investments.max_by{|round| round.investment}
        max_round
    end

    def invested(domain)
        all_funding_rounds = FundingRound.all
        domain_rounds = all_funding_rounds.select {|round| round.startup.domain == domain}
        domain_rounds.map {|round| round.investment}.sum
    end
end
