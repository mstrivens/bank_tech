class Statement
  def print_statement(transactions)
    print_header
    print_transactions(transactions)
  end

  private

  def print_header
    print "Date || Credit || Debit || Balance\n"
  end

  def print_transactions(transactions)
    transactions.reverse.each {|element|
    print "#{element.date} || #{'%.2f'%element.credit} || #{'%.2f'%element.debit} || #{'%.2f'%element.balance}\n"
  }
  end
end
