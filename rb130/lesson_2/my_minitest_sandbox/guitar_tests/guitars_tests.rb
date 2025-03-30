require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
# require_relative '../guitars.rb'
require '/Users/grahamjarvis/local-repos/ls-core-curriculum/rb130/lesson_2/my_minitest_sandbox/guitars.rb'
require "minitest/reporters"
Minitest::Reporters.use!

class GuitarTest < Minitest::Test
  def setup # create a new Guitar object before every test
    @tele = Guitar.new("Fender", "Telecaster", "red")
  end

  def test_is_a_guitar_object
    assert_instance_of(Guitar, @tele)
  end

  def test_output_from_play_method # contains 2 assertions
    expected_output = "The red Fender Telecaster is playing\n" # needs `\n` to match output of `play` method
    return_from_play = @tele.play

    assert_output(expected_output) { @tele.play }
    assert_nil(return_from_play) # because last eval expression is `#puts`
  end

  def test_initial_volume_set_to_zero
    assert_equal(0, @tele.volume)
  end

  def test_set_volume # contains 3 assertions
    @tele.set_volume = 11

    assert_equal(11, @tele.volume)
    assert_output("Volume can't be set above 11\n") {@tele.set_volume = 99}
    assert_output("Volume can't be set below zero\n") {@tele.set_volume = -99}
  end

  def test_private_volume_accessor # Guitar@volume accessor is a private method
    assert_raises(NoMethodError) { @tele.volume = 5 }
  end
end