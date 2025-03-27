require "minitest/autorun"
require_relative "transaction.rb"

# My Solution - exercise 6

# class TransactionTest < Minitest::Test

#   def test_prompt_for_payment
#     transaction = Transaction.new(99)
#     input = StringIO.new("99\n")
#     assert_output("You owe $99.\nHow much are you paying?\n") { transaction.prompt_for_payment(input: input)}
#   end

# end

# My Solution - exercise 7

# class TransactionTest < Minitest::Test

#   def test_prompt_for_payment
#     transaction = Transaction.new(99)
#     input = StringIO.new("99\n")
#     output = StringIO.new
#     transaction.prompt_for_payment(input: input, output: output)
#     assert_equal(99, transaction.amount_paid)
#   end

# end

# LS Solution

class TransactionTest < Minitest::Test

#   def test_prompt_for_payment
#     transaction = Transaction.new(30)
#     input = StringIO.new('30\n')
#     transaction.prompt_for_payment(input: input)
#     assert_equal 30, transaction.amount_paid
#   end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end

end

