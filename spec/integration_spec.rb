require 'statement'

describe Statement do 
  context 'Method functionality' do
    it 'Should add deposit objects to the transactions array when add_deposit is called' do
      statement1 = Statement.new
      depo1 = double(:deposit, amount: 100.00, date: "10/10/2023")
      depo2 = double(:deposit, amount: 200.00, date: "08/08/2023")
      depo3 = double(:deposit, amount: 50.95, date: "09/09/2023")
      statement1.add_deposit(depo1)
      statement1.add_deposit(depo2)
      statement1.add_deposit(depo3)
      expect(statement1.all_transactions.length).to eq(3)
      expect(statement1.all_transactions[0].amount).to eq(100.00)
      expect(statement1.all_transactions[1].date).to eq("08/08/2023")
      expect(statement1.all_transactions[2].amount).to eq(50.95)
    end

    # it 'Should return a formatted list list of all transactions in order earliest date first' do
    #   deposit1 = double(:deposit, amount: 500.00, date: "06/12/2023")
    #   deposit2 = double(:deposit, amount: 50.00, date: "12/12/2023")
    #   withdrawal1 = double(:withdrawal, amount: 200.00, date: "08/12/2023")
    #   statement1 = Statement.new
    #   statement1.add_deposit(deposit1)
    #   statement1.take_withdrawal(withdrawal1)
    #   statement1.add_deposit(deposit2)
    #   expect(statement1.all_transactions).to eq("date || credit || debit || balance\n12/12/2023 || 50.00 ||  || 350.00\n08/12/2023 || || 200.00 || 300.00\n06/12/2023 || 500.00 || || 500.00")
    # end
  end
end
