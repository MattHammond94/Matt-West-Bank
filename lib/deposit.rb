require 'date'

class Deposit 
  attr_accessor :amount, :date

  def initialize(amount)
    @amount = amount
    @date = Date.today
  end
end
