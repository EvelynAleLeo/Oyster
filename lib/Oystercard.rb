class Oystercard

  attr_reader :balance, :entry_station
  LIMIT = 90
  MINIMUM = 1
  MIN_FARE = 2


  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    
    if money > LIMIT
      raise "You have topped up more than #{LIMIT}"
    else
      @balance = money
    end

  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def touch_in(station)
    check_balance
    @entry_station = station
    @in_journey = true
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