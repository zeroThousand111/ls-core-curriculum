# assertion syntax / assert-style syntax

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip("I've skipped the bad wheels test")
    car = Car.new
    assert_equal(3, car.wheels)
  end
end

# Expectation / spec-style syntax

# require 'minitest/autorun'

# require_relative 'car'

# describe 'Car#wheels' do
#   it 'has 4 wheels' do
#     car = Car.new
#     _(car.wheels).must_equal 4           # this is the expectation
#   end
# end