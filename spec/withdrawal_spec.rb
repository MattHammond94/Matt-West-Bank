require 'withdrawal'
require 'date'

describe  do
  context 'Basic functionality' do
    it 'Should return the correct amount when amount is called' do
      withdrawal1 = Withdrawal.new(100.00)
      expect(withdrawal1.amount).to eq(100.00)
    end

    it 'Should return the correct date when date is called' do
      withdrawal1 = Withdrawal.new(100.00)
      date = Date.today.strftime('%d-%m-%Y')
      expect(withdrawal1.date).to eq(date)
    end
  end

  context 'Fails/Error handling' do
    it 'Should return an error if amount entered is not a float type' do
      expect { Withdrawal.new(10) }.to raise_error 'Amount entered is invalid.'
      expect { Withdrawal.new('10') }.to raise_error 'Amount entered is invalid.'
      expect { Withdrawal.new(nil) }.to raise_error 'Amount entered is invalid.'
    end

    it 'Should return an error if amount entered is less than 0' do
      expect { Withdrawal.new(-12.00) }.to raise_error 'Amount entered is invalid.'
    end
  end
end
