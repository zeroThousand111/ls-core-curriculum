def get_bill
  puts "What is the bill?"
  gets.chomp.to_f
end

def get_tip_percentage
  puts "What is the tip percentage?"
  gets.chomp.to_f
end

p bill = get_bill
p percentage = get_tip_percentage / 100
tip = bill * percentage

puts "The tip is $#{tip}"
puts "The total is $#{bill += tip}"