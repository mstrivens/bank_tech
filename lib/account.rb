class Account
  attr_reader :balance
  STARTING_BALANCE = 0
  def initialize
    @balance = STARTING_BALANCE
  end

  def credit(amount)
    add_credit_to_balance(amount)
    create_credit_transaction(amount)
  end

  def debit(amount)
    subtract_debit_from_balance(amount)
    create_debit_transaction(amount)
  end

  private

  def subtract_debit_from_balance(amount)
    @balance -= amount
  end

  def add_credit_to_balance(amount)
    @balance += amount
  end

  def create_credit_transaction(amount)
    Transaction.new(amount, 0, @balance)
  end

  def create_debit_transaction(amount)
    Transaction.new(0, amount, @balance)
  end

end
