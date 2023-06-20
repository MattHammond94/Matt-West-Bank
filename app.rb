require_relative './lib/deposit'
require_relative './lib/withdrawal'
require_relative './lib/statement'

statement1 = Statement.new(Kernel)
deposit1 = Deposit.new(100.00)
withdrawal1 = Withdrawal.new(50.00)
deposit2 = Deposit.new(200.00)
statement1.add_deposit(deposit1)
statement1.take_withdrawal(withdrawal1)
statement1.add_deposit(deposit2)
statement1.print_statement
