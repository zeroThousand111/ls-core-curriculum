# Answer to main problem
# def print_in_box(string)
#   length = string.length
#   puts "+-" + ("-" * length) + "-+"
#   puts "| " + (" " * length) + " |"
#   puts "| " + string + " |"
#   puts "| " + (" " * length) + " |"
#   puts "+-" + ("-" * length) + "-+"
# end

# print_in_box('To boldly go where no man has gone before...')
# print_in_box('')

# Answer to Bonus 1: Truncate to 80 characters

def print_in_box(string)
  length = string.length
  if length > 75
    string = string[0...76]
    length = 76
  end
  puts "+-" + ("-" * length) + "-+"
  puts "| " + (" " * length) + " |"
  puts "| " + string + " |"
  puts "| " + (" " * length) + " |"
  puts "+-" + ("-" * length) + "-+"
end

print_in_box('To boldly go where no man has gone before...')
print_in_box('')
print_in_box('123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')
