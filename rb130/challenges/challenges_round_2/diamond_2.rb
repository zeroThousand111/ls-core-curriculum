# solution 1 - first draft

# class Diamond
#   def initialize(max_letter)
#     @max_letter = max_letter
#     @range_array_up = ("A"..max_letter).to_a
#     @range_array_down = @range_array_up.reverse
#     @range_array_down.shift
#     @output_string = ""
#   end

#   # creates a Diamond object then invokes #make_diamond upon it
#   def self.make_diamond(max_letter)
#     Diamond.new(max_letter).make_diamond
#   end

#   def make_diamond # the return is a multi-line string
#     return "A\n" if @max_letter == "A"

#     build_top
#     build_bottom
#     @output_string
#   end

#   private

#   def build_top
#     @range_array_up.each do |letter|
#       if letter == "A"
#         build_the_a_line
#       else
#         build_line(letter)
#       end
#     end
#   end

#   def build_bottom
#     @range_array_down.each do |letter|
#       if letter == "A"
#         build_the_a_line
#       else
#         build_line(letter)
#       end
#     end
#   end

#   def build_the_a_line
#     outer_whitespace = calc_outer_whitespace("A")
#     @output_string << "#{outer_whitespace}A#{outer_whitespace}"
#     @output_string << "\n"
#   end

#   def build_line(letter)
#     outer_whitespace = calc_outer_whitespace(letter)
#     inner_whitespace = calc_inner_whitespace(letter)

#     @output_string << "#{outer_whitespace}#{letter}#{inner_whitespace}"
#     @output_string << "#{letter}#{outer_whitespace}"
#     @output_string << "\n"
#   end

#   def calc_outer_whitespace(letter)
#     multiple = @range_array_up.reverse.index(letter)
#     " " * multiple
#   end

#   def calc_inner_whitespace(letter)
#     multiple = (@range_array_up.index(letter) * 2) - 1
#     " " * multiple
#   end
# end

# My tests

# p Diamond.make_diamond("A")
# p Diamond.make_diamond("B")
# p Diamond.make_diamond("C")

=begin
# String structure #

A\n

 A \n
B B\n
 A \n
" A \nB B\n A \n"

  A  \n
 B B \n
C   C\n
 B B \n
  A  \n
"  A  \n"\ B B \nC   C\n"\ B B \n"\  A  \n"

    A    \n
   B B   \n
  C   C  \n
 D     D \n
E       E\n
 D     D \n
  C   C  \n
   B B   \n
    A    \n
"    A    \n   B B   \n  C   C  \n D     D \nE       E\n D     D \n  C   C  \n   B B   \n    A    \n"

    A    \n inner whitespace = 0 | index = 0
   B B   \n inner whitespace = 1 | index = 1
  C   C  \n inner whitespace = 3 | index = 2
 D     D \n inner whitespace = 5 | index = 3
E       E\n inner whitespace = 7 | index = 4 | whitespace = (index*2) - 1
 D     D \n
  C   C  \n
   B B   \n
    A    \n
=end

# solution 2 - refactor and use of String#center with args to build a line

class Diamond
  def initialize(max_letter)
    @max_letter = max_letter
    @range_array_up = ("A"..max_letter).to_a
    @range_array_down = @range_array_up.reverse
    @range_array_down.shift
    @max_width = ((@range_array_up.size) * 2) - 1
    @output_array = []
  end

  def self.make_diamond(max_letter)
    Diamond.new(max_letter).make_diamond
  end

  def make_diamond
    return "A\n" if @max_letter == "A"

    build_top
    build_bottom
    @output_array.join("\n") << "\n"
  end

  private

  def build_top
    @range_array_up.each do |letter|
      if letter == "A"
        build_the_a_line
      else
        build_line(letter)
      end
    end
  end

  def build_bottom
    @range_array_down.each do |letter|
      if letter == "A"
        build_the_a_line
      else
        build_line(letter)
      end
    end
  end

  def build_the_a_line
    @output_array << "A".center(@max_width)
  end

  def build_line(letter)
    inner_whitespace = calc_inner_whitespace(letter)
    inner_string = "#{letter}#{inner_whitespace}#{letter}"

    @output_array << inner_string.center(@max_width)
  end

  def calc_inner_whitespace(letter)
    multiple = (@range_array_up.index(letter) * 2) - 1
    " " * multiple
  end
end
