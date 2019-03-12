class Oystercard

  attr_reader :balance
  LIMIT = 90


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

  def deduct(money) 
    @balance -= money
  end
  # def balance
  #   @balance
  # end

end