class Statement

  def initialize
    @transactions = []
  end

  def print_header
    "date || credit || debit || balance"
  end

  def add_deposit(deposit)
    @transactions.push(deposit)
  end

  def take_withdrawal(withdrawal)
    @transactions.push(withdrawal)
  end

  def all_transactions
    @transactions
  end
end
