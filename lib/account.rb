class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit(amount)
    @balance = 1
  end
end
