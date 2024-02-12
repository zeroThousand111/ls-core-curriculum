=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.

INPUT: A string or strings from a text file

OUTPUT: A string with interpolated random words

RULES
EXPLICIT REQUIREMENTS:
  - Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns
  - the text data should come from a file or other external source;
  - You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program;
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

Example replacement words

adjectives: quick lazy sleepy ugly
nouns: fox dog head leg
verbs: jumps lifts bites licks
adverb: easily lazily noisily excitedly

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

- Text file, containing the main text pattern
- Arrays of strings containing sets of words for nouns, verbs, etc.

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create lists of adjectives, nouns, verbs and adverbs
  a. Lists can be arrays of strings and percent strings will make them more readable
    i. adjectives = %W(quick lazy sleepy ugly)
2. Create template text and store in an external text file
  a. To begin with, use the example given in the problem
    i. name new file "madlibs_text1.txt" and store in same directory
3. Import or read the main text from an external text file and assign to a variable
  a. Use open/close approach or a read approach
    i.template_text = File.read("madlibs_text1.txt")
4. Iterate through each line or each word of the text
  a. I will try each line 
    i. new method for me IO.each_line with a block and use `line` as block parameter name
5. Substitute each mention of %{word_type} with a random word from the relevant list of words
  a. I can use the String#gsub! to mutate each String line
    i.line.gsub!('%{adjective}', adjectives.sample)
6. I can output each line after it has been destructively changed to preserve the carriage returns (\n) in the original text document
  a.
    i.puts line

7. Output string

THINGS I AM STUCK ON
1. How to use string interpolation in the imported/read string
2. How do I preserve carriage return?

______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using LS Suggested Words and Pattern

adjectives = %W(quick lazy sleepy ugly)
nouns = %W(fox dog head leg)
verbs = %W(jumps lifts bites licks)
adverbs = %W(easily lazily noisily excitedly)

template_text = File.read("madlibs_text1.txt")
template_text.each_line do |line|
  line.gsub!('%{adjective}', adjectives.sample)
  line.gsub!('%{noun}', nouns.sample)
  line.gsub!('%{verb}', verbs.sample)
  line.gsub!('%{adverb}', adverbs.sample)
  puts line
end

# -------------------

# solution 2 - Using extended word lists

# adjectives = %W(quick lazy sleepy ugly short beautiful cheap brown red loud)
# nouns = %W(fox dog head leg computer cat door mat table car)
# verbs = %W(jumps lifts bites licks drives walks throws cuddles strokes) 
# adverbs = %W(easily lazily noisily excitedly slowly infuriatingly terribly)

# template_text = File.read("madlibs_text2.txt")
# template_text.each_line do |line|
#   line.split.map do |word|
#     line.gsub!('%{adjective}', adjectives.sample)
#     line.gsub!('%{noun}', nouns.sample)
#     line.gsub!('%{verb}', verbs.sample)
#     line.gsub!('%{adverb}', adverbs.sample)
#   end.join(" ")
#   puts line
# end

# -------------------

# solution 3 - Just a String

# adjectives_pool = %W(quick lazy sleepy ugly short beautiful cheap brown red loud)
# nouns_pool = %W(fox dog head leg computer cat door mat table car)
# verbs_pool = %W(jumps lifts bites licks drives walks throws cuddles strokes) 
# adverb_pool = %W(easily lazily noisily excitedly slowly infuriatingly terribly)

# adjectives_count = adjectives.size
# nouns_count = nouns.size
# verbs_count = verbs.size
# adverbs_count = adverbs.size

# adjectives = adjectives.shuffle


# template_text = File.read("madlibs_text1.txt")
# template_text.gsub!('%{adjective}', adjectives_pool.pop)
# puts template_text


# template_text.each_line do |line|
#   line.gsub!('%{adjective}', adjectives.sample)
#   line.gsub!('%{noun}', nouns.sample)
#   line.gsub!('%{verb}', verbs.sample)
#   line.gsub!('%{adverb}', adverbs.sample)
#   puts line
# end

# -------------------

# solution 4 - Offical LS Solution

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end

