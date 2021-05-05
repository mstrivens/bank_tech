# Bank Tech Test

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
