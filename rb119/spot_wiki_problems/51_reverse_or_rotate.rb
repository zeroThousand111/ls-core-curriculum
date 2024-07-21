=begin
51. Reverse or rotate?
(​https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991​)
6 kyu

Reverse or rotate?

The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.
If sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "". 

# PROBLEM
## INPUT: a string of numeric characters AND an integer
## OUTPUT: a NEW string of numeric characters
## RULES
### Explicit requirements:
  - create all substrings aka "chunks" of size (the second argument), but ignore the last chunk if it is smaller than than size
  - RETURN a new string:
    - comprised of all of the substrings joined back together again, but:
    - IF the sum of a substring's digits cubed is divisible by 2 ( % 2 == 0) then reverse that chunk
    - ELSE rotate the digits of that chunk to the left by one position
  - if size is <= 0 or if str is empty return ""
  - if sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return ""
### Implicit requirements:
  - the substrings are not overlapping, they are the input string broken into chunks the size of the second argument
  - "reverse" means reverse the digits in order
    - e.g. "123" becomes "321"
  - "rotate to the left" means move the first digit to the end of the substring
    - e.g. "100" becomes "001"


# EXAMPLES
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> ""
revrot("563000655734469485", 4) --> "0365065073456944"

# DATA STRUCTURES
Input: a string of numeric characters, and an Integer (size)
Intermediate: an array of substring chunks
Output a new string of numeric characters

# ALGORITHM
## HIGH-LEVEL
1. RETURN an empty string if size is zero or less, or if size is greater than the length of the input string
2. CREATE an array of substrings the length of `size`
3. EXAMINE each substring to determine if the sum of its digits cubed is divisible by 2
4. BUILD the output string one substring "chunk at a time", based on the evaluation in step 2

1. RETURN an empty string if size is zero or less, or if size is greater than the length of the input string
2. CREATE an array of substrings the length of `size`
* Use a helper method
* CREATE an empty array
* MOVE through the input string using a loop
  + start_index = 0
  + chunks are string[start_index, size]
  + increment start_index by size each iteration
3. EXAMINE each substring to determine if the sum of its digits cubed is divisible by 2
  + create an array of digits by use #to_i.digits
  + create sum of squares by #map{ |digit| digit**2 }.sum chain
4. BUILD the output string one substring "chunk at a time", based on the evaluation in step 2
* IF the chunk is divisible, SHOVEL the reverse
    - output_string << chunk.reverse
* ELSE SHOVEL a rotated string
  + rotate first digit to the end of the chunk
  + transform as an array first
    - array.append(array.shift).join

=end
def create_chunks(string, size)
  array = []
  start_index = 0
  while start_index + (size - 1) < string.length 
    array << string[start_index, size]
    start_index += size
  end
  array
end

def is_divisible?(chunk)
  array_of_digits = chunk.to_i.digits
  sum_of_squares = array_of_digits.map{ |digit| digit**2 }.sum
  sum_of_squares % 2 == 0
end

def rotate_chunk(chunk)
  array = chunk.chars
  array.append(array.shift).join
end

def revrot(input_string, size)
  output_string = ""
  return output_string if size <= 0 || size > input_string.length
  chunks_array = create_chunks(input_string, size)
  
  chunks_array.each do |chunk|
    if is_divisible?(chunk)
      # p "yes, divisible"
      output_string << chunk.reverse
    else
      output_string << rotate_chunk(chunk)
      # p "nope!"
    end
  end
  
  output_string
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
