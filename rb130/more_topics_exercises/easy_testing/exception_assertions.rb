=begin
Exception Assertions
Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
=end

# My Solution
require "minitest/autorun"

class TestClass << Minitest::Test
  def test_exception
    assert_raises(NoExperienceError) { employee.hire }
  end
end

# LS Solution

assert_raises NoExperienceError do
  employee.hire
end

=begin
Discussion
#assert_raises checks if the given block raises an exception of the named type. If it does not, the assertion fails.
=end

