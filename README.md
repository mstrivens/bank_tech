# Bank Tech Test

## Using the program
- Fork/Clone the repo
- Clone to local repo
- Run bundler

- Run irb
```
require './lib/transaction.rb'
require './lib/account.rb'
require './lib/statement.rb'

account = Account.new
account.credit(10)
account.credit(20)
account.debit(10)

statement = Statement.new
statement.print_statement(account.transaction_history)
```
- This will print off the statement

### Tests
- Run RSpec

### Linter
- Run Rubocop

## Specification

### Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)

Deposits, withdrawal.

Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

**Acceptance criteria**

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### User Stories

As a customer
So I can manage my money
I would like to be able to add money to my account

As a customer
So I can manage my money
I would like to see the date I have deposited money and the amount

As a customer
So i can use my money
I would like to be able to withdraw money

As a customer
So I can manage my money
I would like to see what date I withdrew money and the amount

As a customer
So I can see my whole account transaction
I would like to be able to view my deposit and withdrawal history together

## Planning

Initially I approached this project with the idea of doing as little planning as possible and letting the testing define the code but I realised after one day of coding that while my program was in one sense test driven, i had a fundamental misunderstanding of what test-driving should define in my code.

I decided to start the project again, planning out the structure of my classes and thinking more in depth about how they would interact, their dependencies and how I would test-drive them.

My outcome was a project that was defined by my difficulties previously. My issues arose in they way that my transaction class was dealing with changing the balance as well as saving the transactions as a string. This presented 2 main issues:
  * In saving the transaction as a string it hardcoded the information in a string format that didn't allow any further manipulation or interaction
  * I felt it wasn't the responsibility of the transaction class to change the balance of the account.
In addition my previous approach was based on extracting classes when they weren't neccesary, I found this approach made made my tests redundant regularly and meant i had to change them a lot which goes against the fundamental principles of TDD.


## Further Work

- I have completed 95% of what i intended although given more time would implement the following:
  * Reversing the iteration through he transaction history so it showed newest transactions first

## Feedback

**Documentation**

- It was good to see details of your reasoning and process as well as user stories.
- You could make your usage instructions more readable by using markdown codeblocks for commannd line stuff and stuff that should be entred into IRB rather than bullet points.
- Nice test coverage!

**Object-oriented design**

- You’ve nicely separated the concerns of printing statements and managing deposits and withdrawals from each other.  Creating a separate class to hold transaction data is also a nice way to encapsulate this data and make the code more self-documenting.
- Right now, your Statement and Account classes don’t work together though.  How can you connect them so that the user can use a single object to access all of the functionality? The concept of forwarding might help with that: https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/oo_relationships.md#forwarding

- Does the @transactions_history attribute really need to be part of the public interface of the Account class? If you only added the attribute reader for testing purposes, it can be an indication that you are testing state. How exactly the Account class stores transactions is an implementation detail that other users of the class shouldn’t be relying on and so it shouldn’t be tested directly or made public. That makes it harder to change the way you store them later.
- You shouldn’t need to store the balance separately in an instance variable. It duplicates state since you’re already storing balances in each transaction. Duplicating state can easily lead to bugs creeping in where the different values go out of sync.

**Testing**

- As mentioned above, testing the contents of the array of transactions is testing state rather than behaviour. Following on from one of my comments above about forwarding, if the Account class had something like a print_statement method, then you could use that method to check that the class is correctly keeping track of transactions. And that would be testing behaviour because it’s actually the behaviour the user of the Account class would be able to see.

- In your unit tests, you should be mocking the classes that you are not testing in order to achieve isolation. So in statement_spec.rb, you shouldn’t be using the real Account class. For the Transaction class, I think it’s ok to make an exception because it’s a very simple class that contains almost no logic so there isn’t much to mock away in the first place.

- You’re missing a feature test that demonstrates that the acceptance criteria are met. In the feature test, you would use all your classes working together without mocking them and simulate what the commands the user would enter into IRB.

**Acceptance criteria**

- As you mentioned, you’ll have to implement printing the statement in reverse chronological order to meet the acceptance criteria.
- You initialise the date in Account#initialize, which means that if the user keeps using the same Account object across different days, the dates on the statement will be wrong.


### Summary of forward actions:

[x] Use markdown codeblocks for irb instructions
[x] Connect Statement and Account classes
[x] Reverse the statement printing
[] Remove the attr reader for transaction history
[] Remove balance attribute from accoutn class
[x] Ensure tests mocked where appropriate
[x] Write a feature test
[x] Remove the date from initialize in Accoutn class
