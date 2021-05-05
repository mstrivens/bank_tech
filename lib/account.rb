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
    subtract_debit_from_balance(amount)
  end

  private

  def subtract_debit_from_balance(amount)
    @balance -= amount
  end

  def add_credit_to_balance(amount)
    @balance += amount
  end

  def create_credit_transaction(amount)
    Transaction.new(amount)
  end

end
