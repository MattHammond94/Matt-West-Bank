require 'account'

describe Account do 
  context 'Method functionality' do
    it 'Should add deposit objects to the transactions array when add_deposit is called' do
      account1 = Account.new(Kernel)
      depo1 = double(:deposit, amount: 100.00, date: '10/10/2023')
      depo2 = double(:deposit, amount: 200.00, date: '08/08/2023')
      depo3 = double(:deposit, amount: 50.95, date: '09/09/2023')
      account1.add_deposit(depo1)
      account1.add_deposit(depo2)
      account1.add_deposit(depo3)
      expect(account1.all_transactions.length).to eq(3)
    end

    it 'Should add withdrawal objects to the transactions array when take_withdrawal is called' do
      account1 = Account.new(Kernel)
      depo1 = double(:deposit, amount: 255.00, date: '10/10/2023')
      withd1 = double(:withdrawal, amount: 54.99, date: '10/10/2023')
      withd2 = double(:withdrawal, amount: 200.00, date: '08/08/2023')
      account1.add_deposit(depo1)
      account1.take_withdrawal(withd1)
      account1.take_withdrawal(withd2)
      expect(account1.all_transactions.length).to eq(3)
    end

    it 'Should return a formatted list list of all transactions in order earliest date first' do
      io = double :io
      expect(io).to receive(:puts).with('date || credit || debit || balance').ordered
      expect(io).to receive(:puts).with(['12/12/2023 || 50.00 ||  || 350.00', '08/12/2023 ||  || 200.00 || 300.00', '06/12/2023 || 500.00 ||  || 500.00']).ordered
      deposit1 = double(:deposit, amount: 500.00, date: '06/12/2023')
      withdrawal1 = double(:withdrawal, amount: 200.00, date: '08/12/2023')
      deposit2 = double(:deposit, amount: 50.00, date: '12/12/2023')
      allow(deposit1).to receive(:instance_of?).with(Deposit).and_return(true)
      allow(deposit2).to receive(:instance_of?).with(Deposit).and_return(true)
      allow(withdrawal1).to receive(:instance_of?).with(Deposit).and_return(false)
      account1 = Account.new(io)
      account1.add_deposit(deposit1)
      account1.take_withdrawal(withdrawal1)
      account1.add_deposit(deposit2)
      account1.print_statement
    end
  end
end
