# frozen_string_literal: true

require 'account'

describe Account do
  describe '#balance' do
    it 'initializes on zero' do
      expect(subject.account_balance).to eq Account::STARTING_BALANCE
    end
  end

  # describe '#transaction_history' do
  #   it 'saves transaction objects to an array' do
  #     expect { subject.credit(1) }.to change { subject.transaction_history }
  #   end
  #
  #   it 'saves transaction objects to an array' do
  #     expect{ subject.debit(1) }.to change{ subject.transaction_history }
  #   end
  # end

  describe '#credit' do
    context 'when an account is creditted it adds to the account balance' do
      it 'adds 1 to the balance' do
        subject.credit(1)
        expect(subject.account_balance).to eq(1)
      end

      it 'adds 2 to the balance' do
        subject.credit(2)
        expect(subject.account_balance).to eq(2)
      end

      it 'updates the balance when more than one credit' do
        subject.credit(1)
        subject.credit(2)
        expect(subject.account_balance).to eq(3)
      end

      context 'it adds a default amount of debit when a credit is done' do
        it 'adds a defult of 0 to the debit instance' do
          expect(Account::DEFAULT_CHARGE).to eq(0)
        end
      end
    end
  end

  describe '#debit' do
    context 'it starts with 0 balance' do
      it 'will go to - the amount' do
        subject.debit(1)
        expect(subject.account_balance).to eq (-1)
      end
    end
  end

  describe '#debit' do
    before do
      subject.credit(10)
    end

    context 'when the account is debitted is subtracts from the account balance' do
      it 'takes 1 from the balance' do
        subject.debit(1)
        expect(subject.account_balance).to eq (9)
      end

      it 'takes 2 from the balance' do
        subject.debit(2)
        expect(subject.account_balance).to eq (8)
      end
    end
  end

  describe '#print_statement' do
    before do
      allow(Time).to receive_message_chain(:new, :strftime).and_return("the_date")
    end
    it 'prints out the input with header' do
      account = Account.new
      account.credit(1)
      expect{ account.print_statement }.to output("Date || Credit || Debit || Balance\nthe_date || 1.00 || 0.00 || 1.00\n").to_stdout
    end
    it 'prints out the input with header' do
      account = Account.new
      account.credit(1)
      account.debit(1)
      expect{ account.print_statement }.to output("Date || Credit || Debit || Balance\nthe_date || 0.00 || 1.00 || 0.00\nthe_date || 1.00 || 0.00 || 1.00\n").to_stdout
    end
  end
end
