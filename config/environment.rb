require 'bundler/setup'
Bundler.require
require_rel '../app'

# test instances
new_startup01 = Startup.new("happyCo", "Saul Feliz","tech")
new_startup02 = Startup.new("lemon", "Lulu","apparel")
new_startup03 = Startup.new("jakes", "Jake Tapper","restaurants")
new_startup04 = Startup.new("apple", "Jobs","tech")
new_startup05 = Startup.new("pixar", "Jobs","tech")

new_VentureCapitalist01 = VentureCapitalist.new("James", 2000000000)
new_VentureCapitalist02 = VentureCapitalist.new("Rick", 500000)
new_VentureCapitalist03 = VentureCapitalist.new("Phil", 949532)

new_FundingRound01 = FundingRound.new(new_startup01, new_VentureCapitalist01, "Angel", 100000.00)
new_FundingRound02 = FundingRound.new(new_startup02, new_VentureCapitalist02, "Series C", 58000.00)
new_FundingRound03 = FundingRound.new(new_startup03, new_VentureCapitalist03, "Series A", -45000.00)
new_FundingRound04 = FundingRound.new(new_startup04, new_VentureCapitalist01, "Series B", 50000.00)
new_FundingRound05 = FundingRound.new(new_startup05, new_VentureCapitalist03, "Series D", 250000.00)



new_startup01.sign_contract(new_VentureCapitalist01, "Series F", 20.00)
new_startup01.sign_contract(new_VentureCapitalist02, "Series G", 50.00)


# puts FundingRound.all.count
# p FundingRound.all

# puts "----------test of total_funds----------"
# p new_startup01.total_funds

# puts "-------test of investors----------"
# p new_startup01.investors

# puts "========TRES COMMA CLUB=========="
# p VentureCapitalist.tres_commas_club

# puts "========test of big_investors========="
# p new_startup01.big_investors

# puts "=========offer contract test============"
# p  new_VentureCapitalist03.offer_contract(new_startup05,"Series G",100.0)
# p FundingRound.all.count
# p new_startup05.total_funds

# puts "============vc funding rounds test==========="
# p new_VentureCapitalist02.funding_rounds

# puts "===========portfolio test ============="
# p new_VentureCapitalist02.portfolio

# puts "========== biggest investment test========="
# p new_VentureCapitalist02.biggest_investment

# puts "=======domain test =============="
# p new_VentureCapitalist02.invested("apparel")
# p new_VentureCapitalist02.invested("tech")
