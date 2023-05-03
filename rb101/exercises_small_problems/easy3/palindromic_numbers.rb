# definition
# def palindromic_number?(n)
#   n.to_s.reverse == n.to_s
# end

# tests
# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true

# further exploration method
def palindromic_number?(n)
  n.to_s.reverse == n.to_s
end


# further exploration tests
p palindromic_number?(012321) == false
p palindromic_number?(0123210) == true
p palindromic_number?(010) == true
p palindromic_number?(00100) == true