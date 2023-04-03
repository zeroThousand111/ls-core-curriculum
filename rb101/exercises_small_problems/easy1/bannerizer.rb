# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# print_in_box aka bannerizer method
def print_in_box(string)
    width = string.length + 2
    dashes_array = []
    spaces_array = []
    width.times{dashes_array.push("-")}
    width.times{spaces_array.push(" ")}
    dashes = dashes_array.join
    spaces = spaces_array.join
    puts "+" + dashes  + "+"
    puts "|" + spaces  + "|"
    puts "| #{string} |"
    puts "|" + spaces  + "|"
    puts "+" + dashes  + "+"
end


# get user input
puts "Please enter your phrase:"
user_string = gets.chomp

print_in_box(user_string)


# print_in_box("hello there ladies and gentlemen!")
# print_in_box('To boldly go where no one has gone before.')