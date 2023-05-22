def print_in_box(string)
  string_length = string.size
  dash_line = "+" + ("-" * (string_length + 2)) + "+"
  clear_line = "|" + (" " * (string_length + 2)) + "|"
  middle_line = "| " + string + " |"
  puts dash_line
  puts clear_line
  puts middle_line
  puts clear_line
  puts dash_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('Hello there!')
print_in_box('Whhhooooops....')
print_in_box(' ')