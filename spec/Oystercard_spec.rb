require 'Oystercard.rb'

describe Oystercard do
  # In order to use public transport
  # As a customer
  # I want money on my card

  it 'has a balance of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end
end