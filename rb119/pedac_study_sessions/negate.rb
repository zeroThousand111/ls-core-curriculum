=begin
Write a function, `negate`, that converts all `“yes”` words to `"no"` and `"no"` words to `"yes"` in a sentence. The comparison for `"yes"` and `"no"` should be case insensitive.`"yes"` and `"no"` should be negated even if ending with `.`, `?`, `,`, or `!`.

# PROBLEM
## INPUT: a string of "words"
## OUTPUT: a new transformed string of "words"
## RULES
### EXPLICIT REQUIREMENTS
  - convert all "yes" words to "no", convert all "no" words to "yes"
  - case insensitive, in other words, convert and include case included
  - convert even if word ends in . ? , !
  
### IMPLICIT REQUIREMENTS
  - return is a NEW string
  - "yes" => "no"
  - "Yes" => "No"
  - "no" => "yes"
  - "No" => "Yes"

# EXAMPLES
p negate("Yes, I said no but now I say yes.") # "No, I said yes but now I say no."
p negate("no way, yes way!") # "yes way, no way!"
p negate("Yesterday is not today?") # "Yesterday is not today?"
p negate("No, I do not know!") # "Yes, I do not know!"

# DATA STRUCTURES
input: a string
output: a string
intermediate: a hash of input (keys) and negated words (values)
{
  "yes" => "no"
  "Yes" => "No"
  "no" => "yes"
  "No" => "Yes"
}

# ALGORITHM
## HIGH-LEVEL
1. Create a reference hash of words and negations replacements
2. Split the string into words, delineated by whitespace
3. Create an empty output array
4. Shovel each word to the output string, but use String#sub to replace any yes or no words
5. Join and return the output array

## DETAIL
1. Create a reference hash of words and negations replacements
  {
  "yes" => "no"
  "Yes" => "No"
  "no" => "yes"
  "No" => "Yes"
}
2. Split the string into words, delineated by whitespace
* SPLIT the string into words
  + use #split
3. Create an empty output array
    - output = []
4. Shovel each work to the output string, but use String#sub to replace any yes or no words
* DETERMINE if the word includes one of the hash keys
  + use #include?
  + remove any punctuation first i.e. ".?,!"
    - HASH.include?(word.delete(".?,!"))
* IF the word includes the hash, shovel a transformed string to the output array
  + use #sub
  + for the "trigger" string pattern to have punctuation removed, used #delete
    - word.delete(".?,!")
  + the replacement pattern is HASH[word.delete(".?,!")
    - output << word.sub(word.delete(".?,!"), HASH[word.delete(".?,!")])
* ELSE shovel the word to the output array
    - output << word.sub()
5. Join and return the output string
* Join the string
  + use #join
* Return the string

=end

HASH =  {
          "yes" => "no",
          "Yes" => "No",
          "no" => "yes",
          "No" => "Yes"
          }
          
def negate(input)
  array = input.split
  output = []
  array.each do |word|
    if HASH.include?(word.delete(".?,!"))
      output << word.sub(word.delete(".?,!"), HASH[word.delete(".?,!")])
    else 
      output << word
    end
  end
  
  output.join(' ')
end

# Test cases
p negate("Yes, I said no but now I say yes.") # "No, I said yes but now I say no."
p negate("no way, yes way!") # "yes way, no way!"
p negate("Yesterday is not today?") # "Yesterday is not today?"
p negate("No, I do not know!") # "Yes, I do not know!"