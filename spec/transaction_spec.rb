require 'transaction'

describe Transaction do

  describe '#credit' do
    it 'is changed by 1 when transaction is initialized with 1' do
      transaction = Transaction.new(0, 1, 0, 0)
      expect(transaction.credit).to eq 1
    end
  end

  describe '#debit' do
    it 'is changed by 1 when transaction is initialized with 1' do
      transaction = Transaction.new(0, 0, 1, 0)
      expect(transaction.debit).to eq 1
    end
  end

  describe '#balance' do
    it 'is changed by 1 when transaction is initialized with 1' do
      transaction = Transaction.new(0, 0, 0, 1)
      expect(transaction.balance).to eq 1
    end
  end
  describe '#date' do
    it 'is initialized with the date' do
      transaction = Transaction.new("the_date", 0, 0, 1)
      # allow(transaction).to receive(:date).and_return("the_date")
      expect(transaction.date).to eq "the_date"
    end
  end
end
