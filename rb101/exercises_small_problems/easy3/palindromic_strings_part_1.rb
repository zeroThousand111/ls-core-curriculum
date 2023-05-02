# original method
# def palindrome?(string)
#   reversed_string = string.reverse
#   string == reversed_string
# end

# further exploration
# array method
# def palindrome?(array)
#   array == array.reverse
# end

# combined string and array method
def palindrome?(string)
  array = string.chars
  array == array.reverse
end

# example tests
# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true

# array tests
p palindrome?([1, 2, 3, 4, 5]) == false
p palindrome?([1, 2, 3, 2, 1]) == true
