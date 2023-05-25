# def uppercase?(string)
#   prep_string = string.delete("^a-zA-Z")
#   prep_string.count("A-Z") == prep_string.length
# end

# Sedonia's ASCII argument
def uppercase?(string)
  string == string.upcase(:ascii)
end

# tests
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true