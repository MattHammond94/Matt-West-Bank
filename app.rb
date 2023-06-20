require_relative './lib/deposit'
require_relative './lib/withdrawal'
require_relative './lib/statement'

# Methods will be added to the app.rb file and tested to allow user to select options from a menu.

statement1 = Statement.new(Kernel)
# deposit1 = Deposit.new(100.00)
# withdrawal1 = Withdrawal.new(50.00)
# deposit2 = Deposit.new(200.00)
# withdrawal2 = Withdrawal.new(200.00)
# deposit3 = Deposit.new(54.99)
# statement1.add_deposit(deposit1)
# statement1.take_withdrawal(withdrawal1)
# statement1.add_deposit(deposit2)
# statement1.take_withdrawal(withdrawal2)
# statement1.add_deposit(deposit3)
statement1.print_statement
