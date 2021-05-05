class Account
  attr_reader :balance, :transaction_history, :date
  STARTING_BALANCE = 0

  def initialize
    @balance = STARTING_BALANCE
    @transaction_history = []
    @date = Time.new.strftime("%d/%m/%Y")
  end

  def credit(amount)
    add_credit_to_balance(amount)
    save_to_transaction_history(new_credit_transaction(amount))
  end

  def debit(amount)
    subtract_debit_from_balance(amount)
    save_to_transaction_history(new_debit_transaction(amount))
  end

  private

  def save_to_transaction_history(transaction)
    @transaction_history.push(transaction)
  end

  def subtract_debit_from_balance(amount)
    @balance -= amount
  end

  def add_credit_to_balance(amount)
    @balance += amount
  end

  def new_credit_transaction(amount)
    Transaction.new(@date, amount, 0, @balance)
  end

  def new_debit_transaction(amount)
    Transaction.new(@date, 0, amount, @balance)
  end
end
