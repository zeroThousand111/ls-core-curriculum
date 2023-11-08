count = 1

loop do
  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"
  end
  count += 1
  break if count > 5
end

=begin
expected output
1 is odd!
2 is even!
3 is odd!
4 is even!
5 is odd!
=end