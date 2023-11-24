=begin
As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"

would be:

words = "The Flintstones Rock"

Write your own version of the rails titleize implementation.
=end

words = "the flintstones rock"


# solution 1: Loop, String Element Assignment and String#upcase

# def titleize(words)
#   counter = 0
#   words_array = words.split

#   loop do
#     words_array[counter][0] = words_array[counter][0].upcase
#     counter += 1
#     break if counter == words_array.size
#   end

#   words = words_array.join(' ')
# end

# p titleize(words)

# solution 2: Each and String Element Assignment and String#upcase

# def titleize(string)
#   words_array = string.split
#   words_array.each do |word|
#     word[0] = word[0].upcase
#   end
#   words_array.join(' ')
# end

# p titleize(words)

# solution 3: Official solution Array#map with Array#split and String#capitalize

p words.split.map { |word| word.capitalize }.join(' ')