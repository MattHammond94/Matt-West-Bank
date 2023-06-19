## 1. Describe the Problem
> As a user
> So that I can check my current account status.
> I would like to see a list of all my previous transactions.

> As a user
> I would like to be able to deposit money into my account.

> As a user
> I would like to be able to withdraw money from my account.

> Bank statement ideally should display as below:
> date || credit || debit || balance
> 14/01/2023 || || 500.00 || 2500.00
> 13/01/2023 || 2000.00 || || 3000.00
> 10/01/2023 || 1000.00 || || 1000.00

## 2. Design the Class System 

_class Statement_  (Could also be account or transactions) 
* Holds an empty array of each transaction (whether deposit or withdrawal)
* Method add_deposit => adds a Deposit object to the initialised empty array.
* Method add_withdrawal => adds a Withdrawal object to the initialised empty array.
* Method show_transactions => Displays all formatted transactions correctly by order of date.

_class Deposit_
* creates a new Deposit instance that holds an amount/total value as an integer and the date of creation.
* Both attributes will be initialized and accessed using attr_accessor.

_class Withdrawal_
* creates a new Withdrawal instance that holds an amount/total value as an integer and a date.
* This class mimics the deposit class (Can use inheritance here)

```ruby 
class Statement
  
  def initialize 
    @transactions = []
  end

  def add_deposit(deposit)
    
  end

  def take_withdrawal(withdrawal)
    
  end

  def all_transactions
    
  end

end

class Deposit

  attr_accessor :amount, :date
  
  def initialize(amount)  
    @amount = amount  => #Undecided whether to use float types for the amount - Will use Int for now.
    @date = Date.today => #Date class required - will need to use doubles with different dates to ensure transactions are sorted correctly.
  end

end

class Withdrawal < Deposit 
end

# ----------------------- Edgecases -----------------------
# Apply to Statement:
# Can only add a deposit if deposit is an instance of deposit - else error.
# Can only take a withdrawal if withdrawal is an instance of withdrawal - else error.
# Can only take a withdrawal if withdrawal.amount is less than current account balance.
# What to showcase if no transactions are added to @transactions i.e. empty array.

# Apply to Deposit and Withdrawal:
# Can only take an integer type for amount at initialize - else error.
# Prevent the input of a value less than or equal to zero.
# Date will be auto initialized as todays date.
# Float values? Float values clearly more applicable for represeting money transactions - what implications will this have?

```

## 3. Create Examples as Integration Tests

``` ruby
deposit1 = Deposit.new(100.00)  => 
withdrawal1 = Withdrawal.new(50.00)
deposit2 = Deposit.new(200.00)
statement1 = Statement.new
statement1.add_deposit(deposit1)
statement1.take_withdrawal(withdrawal1)
statement1.add_deposit(deposit2)
statement1.all_transactions => "date || credit || debit || balance
                                19/06/2023 || 100.00 ||  || 100.00
                                19/06/2023 || || 50.00 || 50.00
                                19/06/2023 || 200.00 || || 250.00"
           
```

## 4. Create Examples as Unit Tests 
```ruby

# Statement test:
deposit1 = double(deposit, amount: 500.00, date: "06/12/2023")
deposit2 = double(deposit, amount: 50.00, date: "12/12/2023")
withdrawal1 = double(withdrawal, amount: 200.00, date: "08/12/2023")
statement1 = Statement.new
statement1.add_deposit(deposit1)
statement1.take_withdrawal(withdrawal1)
statement1.add_deposit(deposit2)
statement1.all_transactions => "date || credit || debit || balance
                                12/12/2023 || 50.00 ||  || 350.00
                                08/12/2023 || || 200.00 || 300.00
                                06/12/2023 || 500.00 || || 500.00"

# Fail cases:
deposit1 = Deposit.new(String)
deposit2 = Deposit.new(nil)
despoit3 = Deposit.new(-10.00) => #All error for incorrect data type

withdrawal1 = Withdrawal.new(String)
withdrawal2 = Withdrawal.new(nil)
withdrawal3 = Withdrawal.new(-10.00) => #All error for incorrect data type

statement1 = Statement.new
statement1.all_transactions => #Error - No transactions have been made.

statement1 = Statement.new
withdrawal1 = double amount: 100 date: Date.today
statement1.take_withdrawal(withdrawal1) => #Error - Withdrawal is greater than current balance.

```

## 5. Implement the Behaviour 
_After each test you write follow the test-driving process of red, green, refactor to implement the behaviour_