class Oystercard

  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Balance limit is £90" unless @balance + value <= LIMIT
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  

end
