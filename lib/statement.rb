class Statement
  def print_statement(transactions)
    print_header
    transactions.each {|element|
    print "#{element.date} || #{element.credit} || #{element.debit} || #{element.balance}"
  }
  end

  private

  def print_header
    puts ["Date || Credit || Debit || Balance"]
  end
end
