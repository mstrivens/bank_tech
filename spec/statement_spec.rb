# frozen_string_literal: true
require 'statement'

describe Statement do
  describe '#print_statement' do
    it 'returns a header' do
      expect{ subject.print_statement }.to output("Date || Credit || Debit || Balance\n").to_stdout
    end
  end
end
