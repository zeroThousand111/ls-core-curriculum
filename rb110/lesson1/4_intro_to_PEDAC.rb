# PEDAC Example 2

# substrings helper method returns array of all possible substrings of string
def substrings(string)
  array = []
  counter = 0
  while counter <= (string.size - 2)
    length = 2
    while length <= (string.size - counter)
      array << string[counter, length]
      length += 1
    end
    counter += 1
  end
  array
end

# is_palindrome helper method returns boolean true if string is a case-sensitive palindrome
def is_palindrome?(string)
  string == string.reverse
end

# palindrome_substrings is the main method
def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

# print tests for substrings method
# p substrings("halo")
# p substrings("goalies")

# truth tests for is_palindrome?
# p is_palindrome?('Dad') == false
# p is_palindrome?('dad') == true
# p is_palindrome?(' ')

# print tests
p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("abcddcbA")
p palindrome_substrings("palindrome")
p palindrome_substrings("")

# test cases
p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
