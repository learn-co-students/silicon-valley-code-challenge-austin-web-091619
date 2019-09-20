class Startup
    attr_reader :founder, :domain
    attr_accessor :name
    @@all = []
    def initialize(founder, name, domain)
        @founder = founder
        @name = name
        @domain = domain
        @@all << self
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def sign_contract(v_c, type, investment)
            FundingRound.new(self, v_c, type, investment)
    end


    def funding_rounds
        #returns an array of all of the startups funding rounds
        FundingRound.all.select{|round| round.startup == self}
    end
    def num_funding_rounds
        #counts the array from funding_rounds
        self.funding_rounds.count
    end
    def total_funds
        #totals the investment from all of the startup's f_rs
        #map the array of rounds into an array of investment then sum that array
        investment_array = self.funding_rounds.map{|round| round.investment}
        total = investment_array.sum
    end

    def investors
        #map the array of rounds into an array of venture capitalists, then uniq it
        v_c_array = self.funding_rounds.map{|round| round.venture_capitalist}
        v_c_array.uniq
    end

    def big_investors
        #check the investors array for v_c with total worth more than 1000000000
        self.investors.select{|v_c| v_c.total_worth > 1000000000}
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_param)
        self.all.find{|startup| startup.founder = founder_param}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end
    
end
