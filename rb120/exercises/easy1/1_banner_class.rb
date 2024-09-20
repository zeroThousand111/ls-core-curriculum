=begin
Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end

Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+

=end

class Banner
  
  def initialize(message)
    @message = message
    @length = message.size
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  
  attr_reader :message, :length
  
  def horizontal_rule
    dashes = "-#{"-" * @length}-"
    "+" + dashes + "+"
  end

  def empty_line
    "| #{" " * @length} |"
  end

  def message_line
    "| #{@message} |"
  end
end

# banner1 = Banner.new('')
# p banner1.horizontal_rule # exposed to test individual method but won't work when private
# p banner1.empty_line # exposed to test individual method but won't work when private

# banner2 = Banner.new('To boldly go where no one has gone before.')
# p banner2.horizontal_rule # exposed to test individual method but won't work when private
# p banner2.empty_line # exposed to test individual method but won't work when private

# puts banner1
# puts banner2


=begin
FURTHER EXPLORATION

Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.
=end

class Banner
  
  def initialize(message, fixed_width=0)
    @message = message
    @fixed_width = fixed_width
    @length = message.size + fixed_width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  
  attr_reader :message, :length, :fixed_width
  
  def horizontal_rule
    dashes = "-#{"-" * @length}-"
    "+" + dashes + "+"
  end

  def empty_line
    "| #{" " * @length} |"
  end

  def message_line
    "| #{" " * (@fixed_width / 2)}#{@message}#{" " * (@fixed_width/2)} |"
  end
end

banner1 = Banner.new('')
# p banner1.horizontal_rule # exposed to test individual method but won't work when private
# p banner1.empty_line # exposed to test individual method but won't work when private

banner2 = Banner.new('To boldly go where no one has gone before.')
# p banner2.horizontal_rule # exposed to test individual method but won't work when private
# p banner2.empty_line # exposed to test individual method but won't work when private

puts banner1
puts banner2

banner3 = Banner.new("Hi, there!", 20)
puts banner3