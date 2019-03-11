class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    
    if money > 90
      raise 'You have topped up too much'
    else
      @balance = money
    end

  end
  # def balance
  #   @balance
  # end

end