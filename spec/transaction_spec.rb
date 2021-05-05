require 'transaction'

describe Transaction do
  describe '#credit' do
    it 'is changed by 1 when transaction is initialized with 1' do
      transaction = Transaction.new(1)
      expect(transaction.credit).to eq 1
    end
  end
end
