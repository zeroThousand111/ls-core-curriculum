=begin
Create a method that takes a string argument and returns a copy of the string with every second character in every third word converted to uppercase. Other characters should remain the same.

Examples

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected

The above tests should each print true.

# UNDERSTAND THE PROBLEM
## INPUT: a string
## OUTPUT: a NEW string
## RULES
### Explicit requirements
  - every second character in every third word should be converted to uppercase
  - other characters stay the same
  - return a NEW copy of the input string
### Implicit requirements
  - 

# DATA STRUCTURES
- An array of words
- An array of characters of each word?

# ALGORITHM

* CREATE empty string to be returned
    - expected = ''
* TRANSFORM the string into words
  + use String#split and default delimiter is ' '
* MOVE through the original string, selecting each WORD in turn
  - will need to track index of every word in the original string
  - use #each_with_index
* DETERMINE if the current word is a THIRD word
  + indices: 2, 5, 8, etc
  + index is a third word when (index + 1) % 3 == 0
* ACT on the determination
  + IF current word is a third word
  + ELSE SHOVEL word to expected string
    - expected << word
* MOVE through each 
=end

def to_weird_case(original)
  original.split.map.with_index do |word, index|
    if (index + 1) % 3 == 0
      word.chars.map.with_index do |char, index|
        if (index + 1) % 2 == 0
          char.upcase
        else
          char
        end
      end.join
    else
      word
    end
  end.join(" ")
end

# test cases

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected