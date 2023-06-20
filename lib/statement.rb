class Statement

  def initialize(io)
    @current_balance = 0
    @transactions = []
    @io = io
  end

  def add_deposit(deposit)
    @current_balance += deposit.amount
    deposit_value = format('%.2f', deposit.amount)
    balance_value = format('%.2f', @current_balance)
    formatted_deposit = "#{deposit.date} || #{deposit_value} ||  || #{balance_value}"
    @transactions.push(formatted_deposit)
  end

  def take_withdrawal(withdrawal)
    @current_balance -= withdrawal.amount
    withdrawal_value = format('%.2f', withdrawal.amount)
    balance_value = format('%.2f', @current_balance)
    formatted_withdrawal = "#{withdrawal.date} ||  || #{withdrawal_value} || #{balance_value}"
    @transactions.push(formatted_withdrawal)
  end

  def print_header
    @io.puts "date || credit || debit || balance"
  end

  def print_statement
    print_header
    @io.puts @transactions.reverse
  end

  def all_transactions
    @transactions
  end
end
