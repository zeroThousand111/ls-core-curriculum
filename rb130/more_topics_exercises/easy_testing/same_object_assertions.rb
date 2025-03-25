=begin
Same Object Assertions
Write a test that will fail if list and the return value of list.process are different objects.
=end

# My Solution

require "minitest/autorun"

class SomeClass << Minitest::Test
  def test_same_object
    assert_same(list, list.process, "Sorry. These aren't the same object")
  end
end

# LS Solution

assert_same list, list.process

=begin
Discussion
#assert_same tests whether its first and second arguments are the same object, as determined by #equal?.
=end