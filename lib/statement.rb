class Statement
  def print_statement
    print_header
  end

  private

  def print_header
    puts ["Date || Credit || Debit || Balance"]
  end
end
