# frozen_string_literal: true
require 'statement'
require 'transaction'

describe Statement do
  let(:transactions) { [transaction_one, transaction_two] }
  let(:transaction_one) { instance_double(Transaction, date: 'date_one', credit: 100.00, debit: 0.00, balance: 100.00) }
  let(:transaction_two) { instance_double(Transaction, date: 'date_two', credit: 0, debit: 10.00, balance: 90.00) }
  describe '#print_statement' do
    it 'returns the transaction history' do
      expect{ subject.print_statement(transactions) }.to output("Date || Credit || Debit || Balance\ndate_two || 0.00 || 10.00 || 90.00\ndate_one || 100.00 || 0.00 || 100.00\n").to_stdout
    end
  end
end
