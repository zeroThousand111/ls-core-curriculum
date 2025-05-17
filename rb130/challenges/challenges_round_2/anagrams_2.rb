# solution 1 - first draft

# class Anagram
#   attr_reader :match_word

#   def initialize(match_word)
#     @match_word = match_word
#   end

#   def match(array)
#     output = []

#     array.each do |word|
#       output << word if anagram?(word)
#     end

#     output
#   end

#   private

#   def anagram?(test_word) # case insensitive
#     return false if match_word.downcase == test_word.downcase
#     sorted_match_word = match_word.downcase.chars.sort.join
#     sorted_test_word = test_word.downcase.chars.sort.join

#     sorted_match_word == sorted_test_word
#   end
# end

# solution 2 - refactor first draft for readability

class Anagram
  attr_reader :match_word

  def initialize(match_word)
    @match_word = match_word.downcase
  end

  def match(array)
    output = []

    array.each do |word|
      output << word if anagram?(word.downcase)
    end

    output
  end

  private

  def anagram?(test_word)
    return false if match_word == test_word
    sort_word_characters(match_word) == sort_word_characters(test_word)
  end

  def sort_word_characters(unsorted_word)
    unsorted_word.chars.sort.join
  end
end
