ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

def positive_integer(string_array, integer)
  string_array.map do |letter|
    if !letter.match?(/[A-Za-z]/)
      letter
    elsif (ALPHABET.index(letter) + integer) > 25 
      ALPHABET[(ALPHABET.index(letter) + integer ) - 26]
    else
      ALPHABET[(ALPHABET.index(letter) + integer)]
    end
  end
end

def negative_integer(string_array, integer)
  string_array.map do |letter|
    if !letter.match?(/[A-Za-z]/)
      letter
    elsif (ALPHABET.index(letter) + integer) < 0 
      ALPHABET[(ALPHABET.index(letter) + integer ) + 26]
    else
      ALPHABET[(ALPHABET.index(letter) + integer)]
    end
  end
end

def encode(string, integer)
  string_array = string.downcase.chars
  if integer >= 0
    new_array = positive_integer(string_array, integer)
  elsif integer < 0
    new_array = negative_integer(string_array, integer)
  else
    puts "That wasn't a valid Integer"
  end
  new_array.join
end

# 1. create get string and get integer functions to allow user to input data

# 2. create ability to include capital letters
# done!

puts "#=> Welcome to ENCODER!"
puts "#=> Please enter the phrase you would like to encode:"

string = gets.chomp

puts "#=> Please enter the number you would like to shift the alphabet (positive and negative numbers allowed):"
integer = gets.chomp.to_i

puts "Your phrase encoded by #{integer} places is '#{encode(string, integer)}'"


# print tests
# p encode("hi", 1)    # => "ij"
# p encode("hello", 2) # => "jgnnq"
# p encode("hi", 0)    # => "hi"
# p encode("hi", 26)   # => "hi"

# # letters going past 26
# p encode("zoo", 3)   # => "crr"

# # non-standard strings
# p encode("", 1)      # => ""
# p encode(" ", 1)     # => " "
# p encode("?!@£$%^&*", 1) # => "?!@£$%^&* "

# # multiple words
# p encode("hi, there!", 1) # => "ij, uifsf!"
# p encode("frgh fdhvdu", 23) # => "code caesar"

# include capital letters
# p encode("Frgh Fdhvdu", 23) # => "code caesar"


# negative integers
# p encode("hi", -1)    # => "gh"
# p encode("abc", -5)    # => "vwx"
# p encode("frgh fdhvdu", -3) # => "code caesar"
