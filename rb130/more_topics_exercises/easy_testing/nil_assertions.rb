=begin
Write a minitest assertion that will fail if value is not nil.
=end

# My Solution

require "minitest/autorun"

class TestClass << Minitest::Test
  def test_nil
    assert_nil(value)
  end
end

# LS Solution

assert_nil value

