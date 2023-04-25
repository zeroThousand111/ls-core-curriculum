# method to evaluate input
def input_evaluation(string)
  string.include?('!')
end

# ask user for input
puts "What is your name?"
name = gets.chomp

# output depending upon result of evaluation method
if input_evaluation(name)
  name = name.delete("!")
  puts "HELLO #{name.upcase}.  WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
