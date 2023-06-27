=begin
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end

def ascii(string)
  10.times do |i|
    puts "#{" " * i} #{string}"
  end
end

ascii("The Flintstones Rock!")