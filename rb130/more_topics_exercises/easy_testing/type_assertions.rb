=begin
Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.
=end

# My Solution

require "minitest/autorun"

class SomeClass << Minitest::Test
  def test_numeric_class
    assertion_instance_of(Numeric, value)
  end
end

# LS Solution

assert_instance_of Numeric, value

=begin
Discussion
#assert_instance_of uses Object#instance_of? to ensure that its second argument is an instance of the class named as its first argument.
=end
