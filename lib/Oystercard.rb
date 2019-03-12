class Oystercard

  attr_reader :balance
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
  end

  def touch_in
    check_balance
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