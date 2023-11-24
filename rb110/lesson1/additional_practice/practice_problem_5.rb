=begin
In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Find the index of the first name that starts with "Be"
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# solution 1: Loop

# counter = 0

# loop do
#   if flintstones[counter].start_with?('Be')
#     puts "The index number of the word starting with 'Be' is #{counter}."
#   end
#   counter +=1
#   break if counter == flintstones.size
# end


# solution 2: Array#each_with_index

flintstones.each_with_index do |word, index|
  if word.start_with?('Be')
    puts "The index number of the word starting with 'Be' is #{index}."
  end
end

# solution 3: Array#index and Array Element Reference (new to me!)

p flintstones.index { |name| name[0, 2] == "Be" }