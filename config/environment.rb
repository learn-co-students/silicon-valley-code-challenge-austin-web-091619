require 'bundler/setup'
Bundler.require
require_rel '../app'


google = Startup.new("google", "bob", "california")
facebook = Startup.new("facebook", "george", "california")
boom = Startup.new("boom", "bob", "Texas")

joe = VentureCapitalist.new("Joe", 3333.00)
chris = VentureCapitalist.new("Chris", 55555.00)
ashley = VentureCapitalist.new("Ashley", 999999999.00)
chad = VentureCapitalist.new("Chad", 2000000)

google.sign_contract(google, chad, "3 month", 20.00)
google.sign_contract(google, ashley, "6 month", 50.00)
google.sign_contract(google, joe, "2 month", 20.00)
facebook.sign_contract(facebook, chris, "1 month", 30.00)
round1 = FundingRound.new(google, ashley, "Seed", 5551000.00)
round2 = FundingRound.new(facebook, ashley, "Pre-Seed", 500.00)
round3 = FundingRound.new(google, chad, "Seed", 800.00)


# puts round1.venture_capitalist
# puts round1.type
# puts round1.investment
# puts FundingRound.all


# puts google.num_funding_rounds 

# puts google.total_funds

# puts google.investors
# puts google.big_investors

# puts ashley.offer_contract(google, "long", 50.0)

# p ashley.portfolio

# puts ashley.biggest_investment.investment

# puts ashley.invested("california")