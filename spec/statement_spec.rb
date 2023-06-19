require 'statement'

describe Statement do
  context 'Method functionality' do
    it 'Should add deposit objects to the transactions array when add_deposit is called' do
      statement1 = Statement.new
      depo1 = Deposit.new(100.00)
      depo2 = Deposit.new(200.00)
      depo3 = Deposit.new(50.95)
      statement1.add_deposit(depo1)
      statement1.add_deposit(depo2)
      statement1.add_deposit(depo3)
      expect(statement1.all_transactions.length).to eq(3)
      expect(statement1.all_transactions[0].amount).to eq(100.00)
      expect(statement1.all_transactions[2].amount).to eq(50.95)
    end
  end
end