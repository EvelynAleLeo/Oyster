class Oystercard

  attr_reader :balance, :entry_station
  LIMIT = 90
  MINIMUM = 1
  MIN_FARE = 2


  def initialize
    @balance = 0
  end

  def top_up(money)
    
    if money > LIMIT
      raise "You have topped up more than #{LIMIT}"
    else
      @balance = money
    end

  end

  def in_journey?
    !@entry_station.nil?
    # if @entry_station.nil?
    #   return false
    # else
    #   return true
    # end
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def touch_in(station)
    check_balance
    @entry_station = station
  end

  def check_balance
    raise "You need a minimum amount (£1) for a single journey" if @balance < MINIMUM
  end
  # def balance
  #   @balance
  # end
  private

  def deduct(money) 
    @balance -= money
  end
end