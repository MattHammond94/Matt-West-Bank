class Account
  def initialize(io)
    @current_balance = 0
    @transactions = []
    @io = io
  end

  def add_deposit(deposit)
    @current_balance += deposit.amount
    @transactions.push(formatter(deposit))
  end

  def take_withdrawal(withdrawal)
    if withdrawal.amount > @current_balance
      raise 'Cannot make a withdrawal due to insufficient funds'
    else
      @current_balance -= withdrawal.amount
      @transactions.push(formatter(withdrawal))
    end
  end

  def print_header
    @transactions.empty? ? @io.puts('You do not have any transactions to display') : @io.puts('date || credit || debit || balance')
  end

  def print_statement
    print_header
    @io.puts @transactions.reverse
  end

  # The all_transactions method below now serves no purpose other than to verify
  # within my tests that objects are correctly being added to the transactions array
  def all_transactions
    @transactions
  end

  def formatter(transaction)
    if transaction.instance_of?(Deposit)
      "#{transaction.date} || #{format('%.2f', transaction.amount)} ||  || #{format('%.2f', @current_balance)}"
    else
      "#{transaction.date} ||  || #{format('%.2f', transaction.amount)} || #{format('%.2f', @current_balance)}"
    end
  end
end
