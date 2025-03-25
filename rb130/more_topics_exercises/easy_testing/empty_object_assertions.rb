=begin
Empty Object Assertions
Write a minitest assertion that will fail if the Array list is not empty.
=end

# My Solution
require "minitest/autorun"

class TestClass << Minitest::Test
  def test_collection_empty
    assert_empty(collection)
  end
end

# LS Solution

assert_empty list

=begin
Discussion
#assert_empty tests whether its first argument responds to the method #empty? with a true value. You can use:

assert_equal true, list.empty?
instead, but #assert_empty is clearer and issues a better failure message.
=end