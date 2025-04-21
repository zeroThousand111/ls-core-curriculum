require 'pry'
require 'pry-byebug'

# SOLUTION 1 - FIRST DRAFT

# class BeerSong
#   def self.verse(num)
#     output_string = ""
#     case num
#     when 2 then output_string << self.verse_two
#     when 1 then output_string << self.verse_one
#     when 0 then output_string << self.verse_zero
#     else
#       output_string << self.standard_verse(num)
#     end
#     output_string
#   end

#   def self.verses(first, last)
#     output_string = ""

#     first.downto(last) do |num|
#       output_string << self.verse(num)
#       output_string << "\n"
#     end

#     output_string.delete_suffix!("\n")
#     output_string
#   end

#   def self.lyrics
#     self.verses(99, 0)
#   end

#   private

#   def self.standard_verse(num)
#     "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
#       "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
#   end

#   def self.verse_two
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#       "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end

#   def self.verse_one
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end

#   def self.verse_zero
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end
# end

# SOLUTION 2 - SECOND DRAFT - REFACTOR

class BeerSong
  def self.verse(num)
    output_string = ""
    case num
    when 2 then output_string << self.verse_two
    when 1 then output_string << self.verse_one
    when 0 then output_string << self.verse_zero
    else
      output_string << self.standard_verse(num)
    end
    output_string
  end

  def self.verses(first, last)
    output_string = ""

    first.downto(last) do |num|
      output_string << self.verse(num)
      output_string << "\n"
    end

    output_string.delete_suffix!("\n")
    output_string
  end

  def self.lyrics
    self.verses(99, 0)
  end

  def self.standard_verse(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" +
    "Take one down and pass it around, #{num - 1} bottles " +
    "of beer on the wall.\n"
  end

  def self.verse_two
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.verse_one
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.verse_zero
    "No more bottles of beer on the wall, no more bottles of beer.\n" +
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

# puts BeerSong.verse(99)
# BeerSong.verse(11)
# BeerSong.verse(1)
# BeerSong.verse(0)
# puts BeerSong.verses(99, 98)
# puts BeerSong.verses(2, 0)
# BeerSong.lyrics