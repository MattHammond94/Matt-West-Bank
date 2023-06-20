require 'account'

describe Account do
  context 'Method functionality' do
    it 'Should print the correct header when print_header is called' do
      io = double :io
      expect(io).to receive(:puts).with('You do not have any transactions to display').ordered
      account1 = Account.new(io)
      account1.print_header
    end

    it 'Should print the correct header when print_header is called' do
      io = double :io
      depo1 = double(:deposit, amount: 200.00, date: '10/10/2023')
      expect(io).to receive(:puts).with('date || credit || debit || balance').ordered
      account1 = Account.new(io)
      account1.add_deposit(depo1)
      account1.print_header
    end

    it 'Should add deposit objects to the transactions array when add_deposit is called' do
      account1 = Account.new(Kernel)
      depo1 = double(:deposit, amount: 100.00, date: '10/10/2023')
      depo2 = double(:deposit, amount: 200.00, date: '11/11/2023')
      depo3 = double(:deposit, amount: 50.95, date: '12/12/2023')
      account1.add_deposit(depo1)
      account1.add_deposit(depo2)
      account1.add_deposit(depo3)
      expect(account1.all_transactions.length).to eq(3)
    end
  end

  context 'Fail/Error scenarios' do
    it 'Should return an error when a withdrawal value higher than current deposit value is attempted' do
      account1 = Account.new(Kernel)
      withd1 = double(:withdrawal, amount: 200.00, date: '08/08/2023')
      expect { account1.take_withdrawal(withd1) }.to raise_error 'Cannot make a withdrawal due to insufficient funds'
    end
  end
end
