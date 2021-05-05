class Statement
  def print_statement(transactions)
    print_header
    print_transactions(transactions)
  end

  private

  def print_header
    puts ["Date || Credit || Debit || Balance"]
  end

  def print_transactions(transactions)
    transactions.each {|element|
    puts "#{element.date} || #{element.credit} || #{element.debit} || #{element.balance}"
  }
  end
end
