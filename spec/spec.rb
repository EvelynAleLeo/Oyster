#In order to pay for my journey
#As a customer
#I need my fare deducted from my card

card = Oystercard.new
card.top_up(10)
card.deduct(2)
p card.balance == 8

