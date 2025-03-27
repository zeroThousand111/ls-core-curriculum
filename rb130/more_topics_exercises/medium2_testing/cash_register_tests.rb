require 'minitest/autorun'
require_relative 'cash_register.rb'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  # def setup
  # end

  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(1)
    transaction.amount_paid = 1

    previous_total = register.total_money
    register.accept_money(transaction)
    current_total = register.total_money

    assert_equal(previous_total + 1, current_total)
  end
  
  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(10)
    transaction.amount_paid = 10

    item_cost = transaction.item_cost
    amount_paid = transaction.amount_paid
    
    assert_equal(amount_paid - item_cost, register.change(transaction))
  end
  
  def test_give_receipt
    item_cost = 10
    register = CashRegister.new(100)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") { register.give_receipt(transaction) }
  end

  
end



