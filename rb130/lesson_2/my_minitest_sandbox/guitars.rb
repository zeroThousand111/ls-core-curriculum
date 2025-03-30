class Guitar
  attr_reader :manufacturer, :model, :finish, :volume
  
  def initialize(manufacturer, model, finish)
    @manufacturer = manufacturer
    @model = model
    @finish = finish
    @volume = 0
  end

  def play
    puts "The #{finish} #{manufacturer} #{model} is playing"
  end

  def set_volume=(value)
    if value > 11
      puts "Volume can't be set above 11"
    elsif value < 0
      puts "Volume can't be set below zero"
    else
      self.volume = value
    end
  end

  private

  attr_writer :volume

end