require 'date'

class Deposit 
  attr_accessor :amount, :date

  def initialize(amount)
    if (!(amount.is_a?(Float)) || amount <= 0)
      fail "Amount entered is invalid."
    else
      @amount = amount
      @date = Date.today.strftime('%d-%m-%Y')
    end
  end
end
