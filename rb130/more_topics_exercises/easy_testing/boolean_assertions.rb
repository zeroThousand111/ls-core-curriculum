=begin
Boolean Assertions
Write a minitest assertion that will fail if the value.odd? is not true.
=end

require 'minitest/autorun'

# My Solution 1

class BooleanTest << Minitest::Test
  def test_value_is_odd
    assert(value.odd?)
  end
end

# My Solution 2 - better with an error message for `assert`

class BooleanTest << Minitest::Test
  def test_value_is_odd
    assert(value.odd?, 'the value is not odd')
  end
end

# LS Solution

assert value.odd?, 'value is not odd'

=begin
Discussion
#assert tests whether its first argument is truthy (that is, it is neither false nor nil). If the first argument is not truthy, the test fails, and the second argument is displayed as the failure message.

Most (but not all) of the minitest assertions let you specify a failure message as the final argument. This is frequently omitted since the error messages provided by default are usually sufficient. However, the default message for assert lacks context, so it is common to specify the failure message when using assert.

assert isn't used directly in most tests since it is usually more important to ensure an exact value is returned; if you want to know that your method returns true and not just a truthy value, assert_equal is a better choice. For example:

assert_equal true, value.odd?
=end
