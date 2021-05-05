class Transaction
  attr_reader :credit, :debit, :balance

  def initialize(credit, debit, balance)
    @credit = credit
    @debit = debit
    @balance = balance
  end

end
