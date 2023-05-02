def palindrome?(string)
  reversed_string = string.reverse
  string == reversed_string
end

# example tests
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true