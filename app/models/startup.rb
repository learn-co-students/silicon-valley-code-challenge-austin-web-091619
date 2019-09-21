require_relative "funding_round"
class Startup
    attr_reader :founder, :domain
    attr_accessor :name, :all, :domains

    @@all = []
    @@domains = []
   
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << domain
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder_name)
        Startup.all.find { |a| a.founder == founder_name }
    end

    def sign_contract(comp, vc, type, amount)
        FundingRound.new(self, vc, type, amount)
      
    end

    def self.all
        @@all
    end

    def self.domains
        @@domains.uniq
    end


    def num_funding_rounds
        count = 0
       FundingRound.all.select do |a|
         if a.startup == self
            count += 1
         end
        end
        count
    end


    def total_funds
        total = 0

        FundingRound.all.select do |info|
            if info.startup == self
             total += info.investment 
            end
        end
        total
    end
    

    def investors
        inv = []
        FundingRound.all.select do |info|
            if info.startup == self
                inv << info.venture_capitalist.name
            end
        end
        inv
    end

    def big_investors
        big_inv = []
        FundingRound.all.select do |info|
            if info.startup == self && info.venture_capitalist.total_worth >= 1000000
            big_inv << info.venture_capitalist.name
            end
        end
        big_inv.uniq
    end

end
