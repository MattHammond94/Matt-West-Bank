class Statement

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def print_header
    "date || credit || debit || balance\n"
  end

  def add_deposit(deposit)
    @current_balance += deposit.amount
    formatted_deposit = "#{deposit.date} || #{deposit.amount} ||  || #{@current_balance}\n"
    @transactions.push(formatted_deposit)
  end

  def take_withdrawal(withdrawal)
    @current_balance -= withdrawal.amount
    formatted_withdrawal = "#{withdrawal.date} ||  || #{withdrawal.amount} || #{@current_balance}\n"
    @transactions.push(formatted_withdrawal)
  end

  def all_transactions
    @transactions
  end
end
