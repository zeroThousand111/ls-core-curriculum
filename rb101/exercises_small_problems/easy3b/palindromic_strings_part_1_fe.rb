# # native array method
# def palindrome?(array)
#   array.reverse == array
# end

# array conversion to string method
def palindrome?(array)
  array.join.reverse == array.join
end


# truth tests
p palindrome?([1, 2, 1]) == true
p palindrome?([1, 2, 3]) == false
p palindrome?([1, 2, 3, 2, 1]) == true
p palindrome?(["a", "b", "c"]) == false
p palindrome?(["a", "b", "a"]) == true

