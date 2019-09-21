require_relative "venture_capitalist"
require_relative "startup"

class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment, :all
    # attr_accessor :type, :investment

    @@all = []

  def initialize(startup, vc, type, amount)
    if amount.class == Float && amount.positive?
    @startup = startup
    @venture_capitalist = vc
    @type = type
    @investment = amount * 1.00
    @@all << self   
  
    end
  end

  def self.all  
    @@all
  end

 

end
