class Oystercard

  attr_reader :balance
  attr_reader :entry_station

  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(value)
    fail "Balance limit is £90" unless @balance + value <= CARD_LIMIT
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    fail "You have an insufficient balance for this journey" unless @balance >= MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station
  end

  def touch_out(fare = MINIMUM_CHARGE)
    deduct(fare)
    @in_journey = false
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
