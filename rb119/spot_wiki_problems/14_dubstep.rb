=begin
14. Dubstep
(​https://www.codewars.com/kata/551dc350bf4e526099000ae5/train/ruby​)
6 kyu
Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep music in his performance. Recently, he has decided to take a couple of old songs and make dubstep remixes from them.
Let's assume that a song consists of some number of words (that don't contain WUB). To make the dubstep remix of this song, Polycarpus inserts a certain number of words "WUB" before the first word of the song (the number may be zero), after the last word (the number may be zero), and between words (at least one between any pair of neighbouring words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.
For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".
Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out what was the initial song that Polycarpus remixed. Help Jonny restore the original song.
Input
The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters
Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.
Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => WE ARE THE CHAMPIONS MY FRIEND

# UNDERSTAND THE PROBLEM
## INPUT: a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters
## OUTPUT: a string containing the original words (before the remix), separated by a space
## RULES
### Explicit requirements:
  - return a decoded new string
  - remove the "WUB"s
  - some, one or none "WUB"s at the beginning of the string
  - some, one or none "WUB"s at the end of the string
  - at least one "WUB" inbetween words
### Implicit requirements: 
  - no white space in input string, but some in output string
  
# EXAMPLES / TEST CASES
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => WE ARE THE CHAMPIONS MY FRIEND

# DATA STRUCTURES
An array of substrings after splitting the input string

# ALGORITHM
* REMOVE some "WUBs" by TRANSFORMING the input string into an array of strings using String#split
* REMOVE the empty substrings from the array of strings
* JOIN the array of strings using a whitespace separator
* RETURN the new string

=end
def song_decoder(input_string)
  array = input_string.split("WUB")
  array.delete_if { |substring| substring.empty? }.join(" ")
end

p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") #=> WE ARE THE CHAMPIONS MY FRIEND
p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"