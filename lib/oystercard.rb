class Oystercard
  attr_reader :balance, :in_journey
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    # @max_balance = 90
    @in_journey = false 
  end
  
  def top_up(amount)
    fail "Can't top up balance over 90" unless @balance + amount <= MAX_BALANCE
      @balance += amount
  end  

  def deduct(cost)
    @balance -= cost
  end  

  def touch_in
    fail "Can't touch in, balance under £1" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end  