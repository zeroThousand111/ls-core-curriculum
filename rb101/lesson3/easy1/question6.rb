# method one - concatenation
def method_one(string)
  puts "Four score and" + " " + string
end

# method two - mutation by <<
def method_two(string)
  puts "Four score and " << string
end

famous_words = "seven years ago..."

method_one(famous_words)
method_two(famous_words)