=begin
Included Object Assertions
Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
=end

# My Solution

require "minitest/autorun"

def TestClass << Minitest::Test
  def test_included
    assert_includes(collection, 'xyz', "Nope, I didn't find it in here!")
  end
end

# LS Solution
assert_includes list, 'xyz'

=begin
Discussion
#assert_includes tests whether its first argument contains the second argument. You can use:

assert_equal true, list.include?('xyz')
instead, but #assert_includes is clearer and issues a better failure message.
=end