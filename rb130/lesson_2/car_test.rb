# assertion syntax / assert-style syntax

require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  # def test_wheels
  #   car = Car.new
  #   assert_equal(4, car.wheels)
  # end

  # def test_bad_wheels
  #   # skip("I've skipped the bad wheels test")
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end

  # assert
  def test_car_exists
    car = Car.new
    assert(car)
  end

  # assert_equal
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  # assert_nil
  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  # assert_raises
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
    end
  end

  # assert_instance_of
  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  # assert_includes
  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car
  
    assert_includes(arr, car)
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