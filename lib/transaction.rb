class Transaction
  attr_reader :credit, :debit, :balance, :date

  def initialize(date=Time.new.strftime("%d/%m/%Y"), credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

end
