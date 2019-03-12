class Oystercard

  attr_reader :balance
  LIMIT = 90


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

  def deduct(money) 
    @balance -= money
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
  end

  def touch_in
    @in_journey = true
  end
  # def balance
  #   @balance
  # end

end