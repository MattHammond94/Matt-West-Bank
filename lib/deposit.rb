require 'date'

class Deposit 
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end
end
