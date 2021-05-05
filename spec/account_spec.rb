require 'account'

describe Account do
  let(:transaction) { Transaction.new(credit) }

  describe '#balance' do
    it 'initializes on zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#credit' do
    context 'when an account is creditted it adds to the account balance' do
      it 'adds 1 to the balance' do
        subject.credit(1)
        expect(subject.balance).to eq(1)
      end

      it 'adds 2 to the balance' do
        subject.credit(2)
        expect(subject.balance).to eq(2)
      end

      it 'updates the balance when more than one credit' do
        subject.credit(1)
        subject.credit(2)
        expect(subject.balance).to eq(3)
      end

      context 'it adds credit to a transaction object' do
        it 'adds 1 credit to a transaction object' do
          expect(subject.credit(1)).to be_instance_of(Transaction)
        end
      end
    end
  end
end
