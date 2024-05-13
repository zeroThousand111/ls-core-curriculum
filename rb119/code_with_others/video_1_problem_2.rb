=begin
Input: an array of strings
Output: a NEW array of strings, characters that are common to all strings in the input array
Rules:
  Explicit requirements:
    - return an array of those string characters that show up in all strings in the input array
    - strings will only contain lowercase characters
  Implicit requirements:
    - Strings in output array will all be single characters
    - If a character appears in all strings, it will logically appear in the first string, so the first string can be used to iterate over

Examples / Test Cases
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "yyyzzz"]) == []

Data structures: arrays and strings

Algorithm:
* CREATE empty output_array
* MOVE through characters of first string object
   + If a character appears in all strings, it will logically appear in the first string, so the first string can be used to iterate over
   + Could use `#each_char`
   + name block parameter `test_char`
* TEST if the character being tested appears in all words in the input_array
  + use `Array#all?`
  + test expression is do all the words include the test character
* ACT on test result
  + append test character to output_array if it is included in all the words
* REMOVE tested character from all words in the array IF there is a match in all words
  + this will not destructively change input array outside the scope of the method because of local variable scoping rules and Ruby
  + what method to use?
  + String#delete! will remove ALL instances of that character, but we want to remove just one
  + String#gsub! will remove ALL instances of that character
  + String#sub! will remove FIRST instance of that character only!  That's what we want!
    - word.sub!(test_char, "")
* RETURN output array
=end

def common_chars(input_array)
  output_array = []
  input_array[0].each_char do |test_char|
    if input_array.all? { |word| word.include?(test_char) }
      output_array << test_char
      input_array.each do |word|
      word.sub!(test_char, "")
      end
    end
  end
  output_array
end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "yyyzzz"]) == []