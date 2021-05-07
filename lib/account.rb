# frozen_string_literal: true

class Account
  attr_reader :account_balance, :date

  STARTING_BALANCE = 0
  DEFAULT_CHARGE = 0

  def initialize
    @account_balance = STARTING_BALANCE
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
    Statement.new.print_statement(@transaction_history)
  end

  private

  def save_to_transaction_history(transaction)
    @transaction_history.push(transaction)
  end

  def subtract_debit_from_balance(amount)
    if account_is_not_new
      update_previous_balance_with_debit(amount)
    else
      new_balance_debit(amount)
    end
  end

  def add_credit_to_balance(amount)
    if account_is_not_new
      update_previous_balance_with_credit(amount)
    else
      new_balance_credit(amount)
    end
  end

  def new_balance_debit(amount)
    @account_balance -= amount
  end

  def new_balance_credit(amount)
    @account_balance += amount
  end

  def update_previous_balance_with_credit(amount)
    @account_balance = @transaction_history.last.balance + amount
  end

  def update_previous_balance_with_debit(amount)
    @account_balance = @transaction_history.last.balance - amount
  end

  def account_is_not_new
    @account_balance != STARTING_BALANCE
  end

  def new_credit_transaction(amount)
    @date = Time.new.strftime('%d/%m/%Y')
    Transaction.new(@date, amount, DEFAULT_CHARGE, @account_balance)
  end

  def new_debit_transaction(amount)
    @date = Time.new.strftime('%d/%m/%Y')
    Transaction.new(@date, DEFAULT_CHARGE, amount, @account_balance)
  end
end
