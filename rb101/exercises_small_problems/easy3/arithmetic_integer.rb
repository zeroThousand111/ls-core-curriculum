# get user input
puts "==> Enter the first number:"
x = gets.chomp.to_i
puts "==> Enter the second number:"
y = gets.chomp.to_i

# perform calculations and output (at the same time)
results = <<RESULTS
==> #{x} + #{y} = #{x + y}
==> #{x} - #{y} = #{x - y}
==> #{x} * #{y} = #{x * y}
==> #{x} / #{y} = #{x / y}
==> #{x} % #{y} = #{x % y}
==> #{x} ** #{y} = #{x**y}
RESULTS

puts results
