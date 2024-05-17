=begin
Write a method to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

Example 1:

Input: ["flower", "flow", "flight"]
Output: "fl"

Example 2:

Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix amongst the input strings

All given inputs are in lowercase a-z



=end
require 'pry'
require 'pry-byebug'

def common_prefix(input_array)
    common_characters =[]
      index = 0
      loop do
        comparison_array = []
        input_array.each do |word|
          comparison_array << word[index]
        end
        common_characters << comparison_array[0] if comparison_array.all?(input_array[0][index])
        index += 1
        break if index == input_array.min_by { |str| str.length}.length
      end
    common_characters.join
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"