class Oystercard

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :history

  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @history = {}
  end

  def top_up(value)
    fail "Balance limit is £90" unless @balance + value <= CARD_LIMIT
    @balance += value
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "You have an insufficient balance for this journey" unless @balance >= MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @history.merge!(entry_station: exit_station)
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
