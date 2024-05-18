=begin
# Understand the Problem
Input: two strings
Output: a Boolean true or false
Rules:
  Explicit requirements:
  - return true if there is a substring that appears in both strings, false if not
  - a substring consists of 2 or more characters, substrings of 1 character are ignored
  - two strings being compared, not any other type of object
  Implicit requirements:
  - strings can contain numeric characters and letters
  - strings can be empty
  - strings don't have white space
  - substring comparison is case insenstive e.g. BANANA = banana

# Examples & Test Cases
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', '111t') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true # N.B. '12'
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrocious')

# Data Structures
- Strings

# Algorithm
* CREATE a helper method to generate an array of substrings
  + use two nested #upto loops
  + begin inner loop at 1, to create min length of substring of 2 characters
  + downcase all the strings to make them comparable
* CREATE an array of all substrings (two or more characters) for string 1
* CREATE an array of substrings for string 2
* MOVE through the array of substrings for string 1
* QUERY - is this substring also in the array of substrings for string 2?
* RETURN true if YES, false if not
=end

def create_an_array_of_substrings(string)
  array = []
  0.upto(string.length - 1) do |start_index|
    (start_index + 1).upto(string.length - 1) do |stop_index|
      array << string[start_index..stop_index].downcase
    end
  end
  array
end

def substring_test(string1, string2)
  array1 = create_an_array_of_substrings(string1)
  array2 = create_an_array_of_substrings(string2)
  array1.each do |substring|
    return true if array2.include?(substring)
  end
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', '111t') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true # N.B. '12'
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrocious')