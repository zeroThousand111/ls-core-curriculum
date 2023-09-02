CHARS = {
  0 => "0",
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9"
}

def integer_to_string(num)
  reversed_array = num.digits.reverse
  string_array = reversed_array.map do |i|
    i = CHARS[i]
  end
  string_array.join
end

# my tests
p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)

# truth tests
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
