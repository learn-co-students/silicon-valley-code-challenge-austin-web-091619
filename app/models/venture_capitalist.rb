require_relative "funding_round"
class VentureCapitalist

    attr_accessor :name, :total_worth, :all

    @@all = []

    def initialize(name, worth)
        @name = name
        @total_worth = worth
        @@all << self
    end

    def self.tres_commas_club
        self.all.select { |a| a.total_worth >= 1000000 }
    end

    def self.all
        @@all
    end

   def offer_contract(start, type, amount)
    FundingRound.new(start, self, type, amount)
   end

   def funding_rounds
    FundingRound.all.select { |fund_round| fund_round.venture_capitalist == self }
   end

   def portfolio
    port = []
    FundingRound.all.select do |fund| 
        if fund.venture_capitalist == self
            port << fund.startup
        end
    end
    port.uniq
   end

   
   def biggest_investment
    biggest_num = 0
    round = nil
   rounds = FundingRound.all.each do |fund|
     if fund.venture_capitalist == self && fund.investment > biggest_num
        biggest_num = fund.investment
        round = fund
     end
    end
    round
    end


  def invested(domain)
    total = 0
    FundingRound.all.select do |fund|
     if fund.startup.domain == domain && fund.venture_capitalist == self
        total += fund.investment
     end
    end
    total
  end


end
