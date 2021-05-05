# frozen_string_literal: true
require 'statement'
require 'transaction'

describe Statement do
  it 'returns the transaction history' do
    @account = Account.new
    @transaction = Transaction.new('the_date', 1, 0, 1)
    @account.transaction_history << @transaction
    expect{ subject.print_statement(@account.transaction_history) }.to output("Date || Credit || Debit || Balance\nthe_date || 1 || 0 || 1").to_stdout
  end
end
