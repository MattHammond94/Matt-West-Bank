require 'deposit'
require 'date'

describe Deposit do
  context 'Basic functionality' do
    it 'Should return the correct amount when amount is called' do
      deposit1 = Deposit.new(100.00)
      expect(deposit1.amount).to eq(100.00)
    end

    it 'Should return the correct date when date is called' do
      deposit1 = Deposit.new(100.00)
      date = Date.today
      expect(deposit1.date).to eq(date)
    end
  end

  context 'Fails/Error handling' do
    it 'Should return an error if amount entered is not a float type' do
      expect { deposit1 = Deposit.new(10) }.to raise_error "Amount entered is invalid."
      expect { deposit2 = Deposit.new("10") }.to raise_error "Amount entered is invalid."
      expect { deposit3 = Deposit.new(nil) }.to raise_error "Amount entered is invalid."
    end

    it 'Should return an error if amount entered is less than 0' do
      expect { deposit1 = Deposit.new(-12.00) }.to raise_error "Amount entered is invalid."
    end
  end
end
