class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit(amount)
    add_credit_to_balance(amount)
    create_credit_transaction(amount)
  end

  def debit(amount)
    @balance -= amount
  end

  private

  def add_credit_to_balance(amount)
    @balance += amount
  end

  def create_credit_transaction(amount)
    Transaction.new(amount)
  end

end
