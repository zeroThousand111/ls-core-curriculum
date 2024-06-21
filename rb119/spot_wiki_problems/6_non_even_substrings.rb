=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
solve("1341") = 7. See test cases for more examples.


# ALGORITHM

* CREATE an empty odd_array = []
* SELECT every possible substring
  + TRANSFORM the substring into an array
  + MOVE through the substring, using two nested #upto iterators, to select every substring of the input string
    - 0.upto(string.size - 1) do |start_index|
    - start_index.upto(string.size - 1) do |stop_index|
    - substring = string[start_index..stop_index]
* DETERMINE IF each substring is odd
  + TRANSFORM substring to an Integer, then invoke Integer#odd? upon that Integer
    - substring.to_i.odd?
* ACT on the determination
  + IF it is odd, SHOVEL it to odd_array
    - odd_array << substring
  + IF it is even, ignore and move on
* MEASURE size of odd_array
  + Use Array#size
* RETURN result of above
=end

def solve(string)
  odd_array = []
  0.upto(string.size - 1) do |start_index|
    start_index.upto(string.size - 1) do |stop_index|
      substring = string[start_index..stop_index]
      odd_array << substring if substring.to_i.odd?
    end
  end
  odd_array.size
end


p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20 
p solve("13472315") == 28