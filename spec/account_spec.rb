require 'account'

describe Account do
  describe '#credit' do
    context 'when an account is creditted it creates a transaction object with 1 credit' do
      it 'adds 1 to the balance' do
        subject.credit(1)
        expect(subject.balance).to eq(1)
      end
    end
  end
end
