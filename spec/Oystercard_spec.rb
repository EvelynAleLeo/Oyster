require 'Oystercard.rb'

describe Oystercard do

  let(:station) { double :station }
  let(:station2) { double :station }
  # In order to use public transport
  # As a customer
  # I want money on my card

  it 'has a balance of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end
  # In order to keep using public transport
  # As a customer
  # I want to add money to my card

  it 'should add money to the card' do
    oystercard = Oystercard.new
    oystercard.top_up(5)
    expect(oystercard.balance).to eq 5
  end
# In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit of 90 pounds on my card

  it 'tells you if you have topped up too much' do
    oystercard = Oystercard.new
    expect { oystercard.top_up(95) }.to raise_error "You have topped up more than 90"
  end

  #In order to pay for my journey
  #As a customer
  #I need my fare deducted from my card

  # it 'reduces balance after paying a journey' do 
  #   oystercard = Oystercard.new
  #   oystercard.top_up(10)
  #   oystercard.deduct(2)
  #   expect(oystercard.balance).to eq 8
  # end

  #In order to get through the barriers
  #As a customer
  #I need to touch in and out
  

  it 'can touch out' do
    oystercard = Oystercard.new
    oystercard.touch_out(station)
    expect(oystercard).not_to be_in_journey # this is a predicate matcher
  end

  it 'can touch in' do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    expect(oystercard).to be_in_journey
  end

#   In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

  it 'raises an error message' do
    oystercard = Oystercard.new
    expect { oystercard.touch_in(station) }.to raise_error "You need a minimum amount (£1) for a single journey"
  end

#   In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card

  it 'deducts the amount from balance when we touch out' do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    expect {oystercard.touch_out(station2)}.to change {oystercard.balance}.by(-2)
  end

#   In order to pay for my journey
# As a customer
# I need to know where I've travelled from
  it 'stores my entry station when touching in' do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    expect(oystercard.entry_station).to eq station
  end

  it 'forgets the entry station when touching out' do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    oystercard.touch_out(station2)
    expect(oystercard.entry_station).to eq nil
  end

  it 'stores my exit station when touching out' do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    oystercard.touch_out(station2)
    expect(oystercard.exit_station).to eq station2
  end
end