require 'statement'

describe Statement do
  context 'Method functionality' do
    it 'Should print the correct header when print_header is called' do
      io = double :io
      expect(io).to receive(:puts).with("date || credit || debit || balance\n").ordered
      statement1 = Statement.new(io)
      statement1.print_header
    end

    it 'Should add deposit objects to the transactions array when add_deposit is called' do
      statement1 = Statement.new(Kernel)
      depo1 = Deposit.new(100.00)
      depo2 = Deposit.new(200.00)
      depo3 = Deposit.new(50.95)
      statement1.add_deposit(depo1)
      statement1.add_deposit(depo2)
      statement1.add_deposit(depo3)
      expect(statement1.all_transactions.length).to eq(3)
    end
  end
end