def string_to_integer(string)
  array_of_strings = string.chars
  array_of_integers = array_of_strings.map do |e|
    case e
      when "1"
        1
      when "2"
        2
      when "3"
        3
      when "4"
        4
      when "5"
        5
      when "6"
        6
      when "7"
        7
      when "8"
        8
      when "9"
        9
      when "0"
        0
    end
  end
  array_of_integers.inject {|a,i| a*10 + i}
end

# my tests
p string_to_integer('4321') 
p string_to_integer('570')

# tests
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570