require 'deposit'

describe Deposit do
  context 'Basic functionality' do
    it 'Should return the correct amount when amount is called' do
      deposit1 = Deposit.new(100.00)
      expect(deposit1.amount).to eq(100.00)
    end
  end
end
