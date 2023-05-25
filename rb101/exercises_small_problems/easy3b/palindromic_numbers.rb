# string method
# def palindromic_number?(n)
#   n.to_s == n.to_s.reverse
# end

# array method
# def palindromic_number?(n)
#   array = n.to_s.chars
#   reverse_array = n.to_s.chars.reverse
#   array == reverse_array
# end

# further exploration
def palindromic_number?(n)
  
end

# tests
# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true

# further exploration tests with leading zeros
# p palindromic_number?(0123210) == true
# p palindromic_number?(022) == false
# p palindromic_number?(050) == true

p palindromic_number?(0123210)
p palindromic_number?(022)
p palindromic_number?(050)