def real_palindrome?(string)
  prepared_string = string.downcase.delete("^0-9a-z")
  prepared_string == prepared_string.reverse
end

# def display(string)
#   string.downcase.delete("^0-9a-z")
# end

# print tests
# p display('madam')
# p display('Madam')
# p display("Madam, I'm Adam")
# p display('356653')
# p display('356a653')
# p display('123ab321')

# tests
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false