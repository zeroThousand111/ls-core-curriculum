# solution 1 - without any hints, just with test suite

class Robot
  attr_accessor :robot_name, :used_names

  @@used_names = []

  def initialize
    @robot_name = nil
  end

  def name
    return @robot_name unless robot_name.nil?
    candidate_name = ""

    loop do
      candidate_name = create_random_name
      break unless @@used_names.include?(candidate_name)
    end

    @@used_names << candidate_name
    self.robot_name = candidate_name
  end

  def reset
    @@used_names.delete(robot_name)
    self.robot_name = nil
  end

  private

  def create_random_letter
    ("A".."Z").to_a.sample
  end

  def create_random_digit
    (0..9).to_a.sample.to_s
  end

  def create_random_name
    random_name = ""
    2.times { random_name << create_random_letter }
    3.times { random_name << create_random_digit }
    random_name
  end
end

# My Tests
p Robot.new.name



