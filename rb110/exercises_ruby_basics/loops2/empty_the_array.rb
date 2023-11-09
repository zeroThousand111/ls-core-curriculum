names = ['Sally', 'Joe', 'Lisa', 'Henry']

# option 1 using Array#shift

# loop do
#   puts names.shift
#   break if names.length <= 0
# end

# option 2 using Array element reference and Array#delete_at

# loop do
#   puts names[0]
#   names.delete_at(0)
#   break if names.length <= 0
# end

# extension - print names from last to first instead

loop do
  puts names.pop
  break if names.empty?
end