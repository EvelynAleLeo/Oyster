require './lib/Oystercard.rb'
#In order to pay for my journey
#As a customer
#I need my fare deducted from my card
# card = Oystercard.new
# card.top_up(10)
# card.deduct(2)
# p card.balance == 8

#In order to get through the barriers
#As a customer
#I need to touch in and out

# card = Oystercard.new
# card.touch_in
# p card.in_journey? == true

# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

# card = Oystercard.new
# p card.touch_in == "saying not enough balance" #raise an error message 

# In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card

card = Oystercard.new
card.top_up(10)
card.touch_in
card.touch_out
card.balance to change by 2


