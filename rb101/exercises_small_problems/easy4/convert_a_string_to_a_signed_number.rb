CONVERSION_HASH = {
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "0" => 0,
}

def string_to_signed_integer(string)
  final_number = 0
  array_of_string_characters = string.chars
  array_of_string_characters.shift if string.start_with?("+", "-")
  array_of_number_characters = array_of_string_characters.map do |letter|
    CONVERSION_HASH[letter]
  end
  place_value = array_of_number_characters.length - 1
  array_of_number_characters.each do |number|
    final_number += number * (10 ** place_value)
    place_value -= 1
  end
  if string.start_with?("-") 
    final_number -= final_number * 2
  else
    final_number
  end
end

# my tests
p string_to_signed_integer('4321')
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')

# official tests
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100