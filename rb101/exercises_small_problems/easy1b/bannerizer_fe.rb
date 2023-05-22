# bannerizer further exploration

# truncate (shorten) method
def print_in_box(message)
  length = message.size > 76 ? 76 : message.size
  horizontal_rule = "+#{'-' * (length + 2)}+"
  empty_line = "|#{' ' * (length + 2)}|"
  middle_line = "| #{message[0...length]} |"
  puts horizontal_rule
  puts empty_line
  puts middle_line
  puts empty_line
  puts horizontal_rule
end



print_in_box('To boldly go where no one has gone before.')
print_in_box('Hello there!')
print_in_box('Whhhooooops....')
print_in_box(' ')
print_in_box('To boldly go where no one has gone before.  And then more and more and more and more!')
print_in_box("----------This line is exactly 80 characters in length don't you know!----------")
print_in_box("--------This line is exactly 76 characters in length don't you know!--------")