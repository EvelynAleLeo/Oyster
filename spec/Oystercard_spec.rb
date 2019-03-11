require 'Oystercard.rb'

describe Oystercard do
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

end