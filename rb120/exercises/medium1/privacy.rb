class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def display_switch_status
    self.switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# my tests
robot = Machine.new
puts robot.start
puts robot.stop
puts robot.display_switch_status
