ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

def brute_force(string)
  string_array = string.downcase.chars
  integer = 1
  
  loop do
    
    shifted_string = string_array.map do |letter|
                      if !letter.match?(/[A-Za-z]/)
                        letter
                      elsif (ALPHABET.index(letter) + integer) > 25 
                        ALPHABET[(ALPHABET.index(letter) + integer ) - 26]
                      else
                        ALPHABET[(ALPHABET.index(letter) + integer)]
                      end
                    end
    
    puts "Shifted #{integer.to_s.rjust(2, '0')} => #{shifted_string.join}"
    
    integer += 1
    break if integer == 26
  end
end

puts "=> Welcome to the CAESER CIPHER BRUTE FORCE DECODER!"
puts "=> Tell me the phrase you want to decode and I will show you all 26 shifted versions:"
input = gets.chomp

brute_force(input)

# test cases
# brute_force('Frgh Fdhvdu')


