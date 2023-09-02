def reversed_number(num)
  array = num.digits
  length = array.length
  reversed_num = 0
  array.each_with_index do |obj, index|
    place_value = (length - index) - 1
    reversed_num += obj * (10 ** place_value)
  end
  reversed_num
end

# tests
p reversed_number(12345)
p reversed_number(12213)
p reversed_number(456)
p reversed_number(12000) # No leading zeros in return value!
p reversed_number(12003)
p reversed_number(1)


# truth tests
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1