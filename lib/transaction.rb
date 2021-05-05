class Transaction
  attr_reader :credit, :debit

  def initialize(credit, debit)
    @credit = credit
    @debit = debit
  end

end
