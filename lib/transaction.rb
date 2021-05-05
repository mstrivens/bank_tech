# frozen_string_literal: true
class Transaction
  attr_reader :credit, :debit, :balance, :date

  def initialize(date, credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
