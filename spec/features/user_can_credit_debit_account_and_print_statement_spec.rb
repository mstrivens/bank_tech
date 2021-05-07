require 'account'
require 'statement'
require 'transaction'

describe 'user can credit, debit and print statement from account' do
  before do
    allow(Time).to receive_message_chain(:new, :strftime).and_return("the_date")
  end
  context 'user can access all feature through account class' do
    let(:account) { Account.new }
    it 'allows the user full scope of feature' do
      account.credit(1000)
      account.credit(2000)
      account.debit(500)
      expect{ account.print_statement }.to output("date || credit || debit || balance\nthe_date || 0.00 || 500.00 || 2500.00\nthe_date || 2000.00 || 0.00 || 3000.00\nthe_date || 1000.00 || 0.00 || 1000.00\n").to_stdout
    end
  end
end
