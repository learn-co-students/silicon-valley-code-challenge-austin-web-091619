require_relative "funding_round"
require_relative "venture_capitalist"

class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
    @@domains = []

    def initialize(name, founder, domain)
        @name =  name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << domain

    end

    def self.all
        @@all
      end

    def pivot(founder, domain)
        @founder = founder
        @domain = domain
    end


    def self.find_by_founder(founder_name)
        Startup.all.find { |startup| founder_name == startup.founder }
            
    end

    def self.domains
        @@domains.uniq
    end
    
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        all_funding_rounds = FundingRound.all
        my_rounds = all_funding_rounds.select{ |round| round.startup == self}
        my_rounds.length
    end

    def total_funds
        all_funding_rounds = FundingRound.all
        my_rounds = all_funding_rounds.select{ |round| round.startup == self}
        cash = my_rounds.map { |round|  round.investment }
        cash.sum
    end

    def investors
        all_funding_rounds = FundingRound.all
        my_rounds = all_funding_rounds.select{ |round| round.startup == self}
        my_investor = my_rounds.map { |round|  round.venture_capitalist.name }.uniq

    end

    def big_investors
        all_my_investors = self.investors
        all_tres = VentureCapitalist.tres_commas_club
        all_tres = all_tres.map {|investors| investors.name}.uniq
        all_my_investors & all_tres
    end

end

