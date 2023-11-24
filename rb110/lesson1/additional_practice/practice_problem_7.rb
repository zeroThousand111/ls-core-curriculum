=begin
Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

=end

statement = "The Flintstones Rock"

# solution 1: Loop with Hash Element Assignment and an IF statement

array_of_chars = statement.chars

counter = 0
hash = {}

loop do
  if hash.has_key?(array_of_chars[counter])
    hash[array_of_chars[counter]] += 1
  else
    hash[array_of_chars[counter]] = 1
  end
  counter += 1
  break if counter == array_of_chars.size
end

p hash

# solution 2: #each_with_object ? and an IF statement

array_of_chars = statement.chars

hash = array_of_chars.each_with_object ({}) do |letter, hash|
  if hash.has_key?(letter)
    hash[letter] += 1
  else
    hash[letter] = 1
  end
end

p hash


# official LS solution using two pre-made arrays and String#count

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end
