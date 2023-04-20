# Pseudo-code
# START
# ---
# Method(string)
# 	- SET string_length = length of passed argument
# 	- SET border_line = "+-" + (string_length * "-") + "-+" # string concatenation
# 	- SET spaces_line = "| " + (string_length * " ") + " |" # string concatenation
# 	- SET word_line = "| " + string + " |" # string concatenation
# 	- PRINT border_line
# 	- PRINT spaces_line
# 	- PRINT word_line
# 	- PRINT spaces_line
# 	- PRINT border_line
# ---
# END

def print_in_the_box(message)
  border_line = "+-#{("-" * message.length)}-+"
  spaces_line = "| #{(" " * message.length)} |"
  message_line = "| #{message} |"
  puts border_line
  puts spaces_line
  puts message_line
  puts spaces_line
  puts border_line
end

print_in_the_box("To boldly go where no man has gone before")