require 'statement'

describe Statement do 
  it 'Should' do
    deposit1 = double(:deposit, amount: 500.00, date: "06/12/2023")
    deposit2 = double(:deposit, amount: 50.00, date: "12/12/2023")
    withdrawal1 = double(:withdrawal, amount: 200.00, date: "08/12/2023")
    statement1 = Statement.new
    statement1.add_deposit(deposit1)
    statement1.take_withdrawal(withdrawal1)
    statement1.add_deposit(deposit2)
    expect(statement1.all_transactions).to eq("date || credit || debit || balance\n12/12/2023 || 50.00 ||  || 350.00\n08/12/2023 || || 200.00 || 300.00\n06/12/2023 || 500.00 || || 500.00")
  end
end
