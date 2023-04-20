def print_in_box(string)
  # define lines to be printed
  string_length = string.length
  # create correct number of dashes as a string
  dashes = ""
  string_length.times do | item |
    dashes << "-"
  end
  # create correct number of spaces as a string
  spaces = ""
  string_length.times do | item |
    spaces << " "
  end
  # assemble lines in the box
  border_line = "+-" + dashes + "-+"
  spaces_line = "| " + spaces + " |"
  word_line = "| " + string + " |"
  
  # output string in the box
  puts border_line
  puts spaces_line
  puts word_line
  puts spaces_line
  puts border_line
end

print_in_box("hello")
print_in_box("")
print_in_box('To boldly go where no one has gone before.')
print_in_box("Hello, Ruby.  I hate you!")