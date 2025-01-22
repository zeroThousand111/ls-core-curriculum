=begin
Design a Sports Team (Author Unknown...thank you!)

- Include 4 players (attacker, midfielder, defender, goalkeeper)
- All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
- All players can run and shoot the ball.
- Attacker should be able to lob the ball
- Midfielder should be able to pass the ball
- Defender should be able to block the ball
- The referee has a whistle. He wears black and is able to run and whistle.
=end

module Runnable
  def run
    "I'm running!"
  end
end

class Player
  include Runnable

  attr_reader :jersey, :has_whistle

  def initialize
    @jersey = "blue"
    @has_whistle = false
  end

  def shoot
    "I'm taking a shot!"
  end
end

class Attacker < Player
  def lob
    "I'm lobbing the ball!"
  end
end

class Midfielder < Player
  def pass
    "I'm passing the ball!"
  end
end

class Defender < Player
  def block
    "I'm blocking the other team!"
  end
end

class Goalkeeper < Player
  def initialize
    @jersey = "white with blue stripes"
  end
end

class Referee
  include Runnable

  attr_reader :jersey, :has_whistle

  def initialize
    @jersey = "black"
    @has_whistle = true
  end

  def whistle
    "pew pew!"
  end
end

attacker = Attacker.new
defender = Defender.new
midfielder = Midfielder.new
goalkeeper = Goalkeeper.new
ref = Referee.new

# p attacker, defender, midfielder, goalkeeper, ref

puts attacker.run, defender.run, midfielder.run, goalkeeper.run, ref.run
puts attacker.jersey, defender.jersey, midfielder.jersey, goalkeeper.jersey, ref.jersey
puts attacker.lob, defender.block, midfielder.pass, ref.whistle
puts attacker.has_whistle, ref.has_whistle