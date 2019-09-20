require_relative "funding_round"

class Startup

    attr_reader :founder_name, :domain, :name, :num_funding_rounds, :total_funds

    @@all_startups = []

    def initialize (name, founder_name, domain)
        @name = name
        @founder_name = founder_name
        @domain = domain
        
        @num_funding_rounds = 0
        @total_funds = 0
        @investors = []
        @big_investors = []

        @@all_startups << self
    end

    def pivot (new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def sign_contract (venture_capitalist, investment_type, investment)
        @investors << venture_capitalist.name
        @total_funds += investment
        @num_funding_rounds += 1
        if investment >= 1000000000
            @big_investors << venture_capitalist.name
        end

        FundingRound.new(self, venture_capitalist, investment_type, investment)
    end

    def investors
        @investors.uniq
    end

    ######################
    # CLASS METHODS BELOW #
    ######################

    def self.all
        @@all_startups
    end

    def self.find_by_founder (founder_name)
        result = @@all_startups.select { |startup| startup.founder_name == founder_name }
        result[0]
    end
    
    def self.domains
        result = []
        @@all_startups.each { |startup| result << startup.domain }
        result
    end

end

#TESTING TESTING TESTING TESTING TESTING TESTING TESTINGTESTING TESTING 
#TESTING TESTING TESTING TESTING TESTING TESTING TESTINGTESTING TESTING 
#TESTING TESTING TESTING TESTING TESTING TESTING TESTINGTESTING TESTING 

supp = Startup.new("supp", "Brad Kim", "San Jose")
what_up = Startup.new("what_up", "Oscar Song", "Palo Alto")

# puts supp
# puts what_up

# puts supp.name
# puts what_up.name

# puts supp.founder_name
# puts what_up.founder_name

# puts supp.domain
# puts what_up.domain

# puts "all"
# puts Startup.all
# puts Startup.domains
# puts ""

# supp.pivot("TX", "TX_supp")
# what_up.pivot("KY", "KY_what_up")

# puts "chaneged vals"

# puts supp.domain
# puts what_up.domain

# puts supp.name
# puts what_up.name

# puts Startup.find_by_founder("Oscar Song")

# puts Startup.domains