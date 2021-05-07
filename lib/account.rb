# frozen_string_literal: true

class Account
  attr_reader :balance, :transaction_history, :date

  STARTING_BALANCE = 0
  DEFAULT_CHARGE = 0

  def initialize
    @balance = STARTING_BALANCE
    @transaction_history = []
  end

  def credit(amount)
    add_credit_to_balance(amount)
    save_to_transaction_history(new_credit_transaction(amount))
  end

  def debit(amount)
    subtract_debit_from_balance(amount)
    save_to_transaction_history(new_debit_transaction(amount))
  end

  def print_statement
    statement = Statement.new
    statement.print_statement(@transaction_history)
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
    @date = Time.new.strftime('%d/%m/%Y')
    Transaction.new(@date, amount, DEFAULT_CHARGE, @balance)
  end

  def new_debit_transaction(amount)
    @date = Time.new.strftime('%d/%m/%Y')
    Transaction.new(@date, DEFAULT_CHARGE, amount, @balance)
  end
end
