require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
google = Startup.new("founder dude","google","domain")
swoogle = Startup.new("founder lady","swoogle","top tier domain")
poogle = Startup.new(" dudes","poogle","chow mein")
larry = VentureCapitalist.new("larry")
al = VentureCapitalist.new("al")
marge = VentureCapitalist.new("marge")
larry.offer_contract(google, "series a", 10000000)
al.offer_contract(google, "series b", 10000000)
al.offer_contract(swoogle, "series a", 1000000000)
al.offer_contract(poogle, "angle", 10000000)
google.sign_contract(marge, "angle", 12345)
swoogle.sign_contract(marge, "angle", 1222345)
VentureCapitalist.all 
VentureCapitalist.tres_commas_club
google.num_funding_rounds
swoogle.num_funding_rounds
google.total_funds
google.investors
google.big_investors
al.portfolio
al.biggest_investment
al.invested("chow mein")
binding.pry
0 #leave this here to ensure binding.pry isn't the last line