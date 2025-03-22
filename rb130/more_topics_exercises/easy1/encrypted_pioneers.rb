
=begin
# Problem
The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

## Input: A string of alphabetic characters
## Output: A new string of different characters
## Rules:
### Explicit requirements
  - output string should be a name of a computing pioneer
  -
### Implicit requirements
  - output string should contain new characters, each 13 places behind the
  - Capitalisation should be preserved, so capital letters will need to be treated differently from lower case i.e. not pure ascii-betical order
  - any non-alphabetic characters should remain unchanged in the unencrypted string

# Examples/Test Cases

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
Write a program that deciphers and prints each of these names.

# Data Structures
A string, but potentially useful to work on an array of strings?

# Algorithm
* STEP
  + approach
    - procedure

## High Level
* MOVE through the input string one character at a time
  + could use String#each_char
  + could create an array of chars
* DETERMINE what the char is:
  1. alphabetic char - lowercase
  2. alphabetic char - uppercase
  3. non-alphabetic char
* ACT upon above determination
  1. add lowercase alphabetic char -13 places in alphabet to output string
  2. add uppercase alphabetic char -13 places in alphabet to output string
  3. add non-alphabetic char to output string
* STOP moving through string at end
* RETURN output string

## Detail
* CREATE an empty output string
  + Could create an empty string?
  + Could create an empty array of string chars
  + Could use Array#map if chars are an array of chars
* CREATE two arrays of alphabetical characters; one lowercase, one uppercase
* MOVE through the input encrypted string one character at a time
  + use #each_char
* DETERMINE if current char is uppercase or lowercase
* DETERMINE current char index number in table
* CALCULATE index of char -13 places in table (account for chars with index of less than 13)
* SHOVEL this char into output string
* STOP iterating at last character
* RETURN output string
=end

# ---//---

# Code
require 'pry'
require 'pry-byebug'

# My First Solution - I AM SO RUSTY!!!

LOWERCASE_TABLE = ("a".."z").to_a
UPPERCASE_TABLE = ("A".."Z").to_a
ROTATE_VALUE = 13

def unencrypt_rot_13(encrypted_string)
  unencrypted_string = ""

  encrypted_string.each_char do |char| 
    
    if char.match(/[^a-zA-Z]/)  # i.e. is not an alphabetic character
      unencrypted_string << char
      next
    end

    duplicate_char = char.dup
    determine_case = duplicate_char.upcase! == nil ? "upper" : "lower" # ternary statement | if duplicate_char.upcase! == nil then char is uppercase

    table_index = nil

    # could I use a `#gsub` method around here?

    if determine_case == "upper"
      UPPERCASE_TABLE.each_with_index do |letter, index|
         table_index = index if letter == char
      end

    elsif determine_case == "lower"
      LOWERCASE_TABLE.each_with_index do |letter, index|
        table_index = index if letter == char
     end
    end
    
    if table_index < 13
      table_index = table_index + 26
    end

    original_index = table_index - ROTATE_VALUE

    if determine_case == "upper"
      unencrypted_string << UPPERCASE_TABLE[original_index]
    elsif determine_case == "lower"
      unencrypted_string << LOWERCASE_TABLE[original_index]
    end
  end

  unencrypted_string
end

# OMG that was tortuous!  I am so out of practice!

# ---//---

# My Second Solution - before I looked at the official LS solution

ALPHABET = ("a".."z").to_a
DECRYPT_ROTATE_VALUE = -13

def unencrypt_rot_13(encrypted_string)
  encrypted_array_of_chars = encrypted_string.chars

  unencrypted_array_of_chars = encrypted_array_of_chars.map do |char|
    evaluate_char(char)
  end

  unencrypted_array_of_chars.join
end

def evaluate_char(char)
  if char.match(/[^a-zA-Z]/)
    return char
  elsif char.match(/[A-Z]/)
    return find_unrotated_char(char.downcase).upcase
  elsif char.match(/[a-z]/)
    return find_unrotated_char(char)
  end
end

def find_unrotated_char(char)
  alpha_index = ALPHABET.index(char)
  alpha_index = alpha_index + 26 if alpha_index < 13
  ALPHABET[alpha_index + DECRYPT_ROTATE_VALUE] # this is currently -13
end

# my tests
# puts unencrypt_rot_13('n')
# puts unencrypt_rot_13('N')
# puts unencrypt_rot_13('a')
# puts unencrypt_rot_13('A')
# puts unencrypt_rot_13('*')

# test cases
# puts unencrypt_rot_13("Nqn Ybirynpr")       # => Ada Lovelace
# puts unencrypt_rot_13("Tenpr Ubccre")       # => Grace Hopper
# puts unencrypt_rot_13("Nqryr Tbyqfgvar")    # => Adele Goldstine
# puts unencrypt_rot_13("Nyna Ghevat")        # => Alan Turing
# puts unencrypt_rot_13("Puneyrf Onoontr")    # => Charles Babbage
# puts unencrypt_rot_13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv") # => Abdullah Muhammad bin Musa al-Khwarizmi
# puts unencrypt_rot_13("Wbua Ngnanfbss")     # => John Atanasoff
# puts unencrypt_rot_13("Ybvf Unvog")         # => Lois Haibt
# puts unencrypt_rot_13("Pynhqr Funaaba")     # => Claude Shannon
# puts unencrypt_rot_13("Fgrir Wbof")         # => Steve Jobs
# puts unencrypt_rot_13("Ovyy Tngrf")         # => Bill Gates
# puts unencrypt_rot_13("Gvz Orearef-Yrr")    # => Tim Berners-Lee
# puts unencrypt_rot_13("Fgrir Jbmavnx")      # => Steve Wozniak
# puts unencrypt_rot_13("Xbaenq Mhfr")        # => Konrad Zuse
# puts unencrypt_rot_13("Fve Nagbal Ubner")   # => Sir Antony Hoare
# puts unencrypt_rot_13("Zneiva Zvafxl")      # => Marvin Minsky
# puts unencrypt_rot_13("Lhxvuveb Zngfhzbgb") # => Yukihiro Matsumoto
# puts unencrypt_rot_13("Punllvz Fybavzfxv")  # => Chayyim Slonimski
# puts unencrypt_rot_13("Tregehqr Oynapu")    # => Gertrude Blanch

# My Third Solution - Using OOP before I looked at the official LS Solution

class EncryptedString
  ALPHABET = ("a".."z").to_a

  attr_accessor :string
  attr_reader :encryption_rotation

  def initialize(string, encryption_rotation)
    @string = string
    @encryption_rotation = encryption_rotation
  end

  def decrypt_string
    string.chars.map { |char| evaluate_char(char) }.join
  end

  private

  def evaluate_char(char)
    if char.match(/[^a-zA-Z]/)
      return char
    elsif char.match(/[A-Z]/)
      return find_unrotated_char(char.downcase).upcase
    elsif char.match(/[a-z]/)
      return find_unrotated_char(char)
    end
  end
  
  def find_unrotated_char(char)
    alpha_index = ALPHABET.index(char)
    alpha_index = alpha_index + 26 if alpha_index < encryption_rotation.abs
    ALPHABET[alpha_index - encryption_rotation]
  end

end

# my OOP tests
# puts EncryptedString.new('n', 13).decrypt_string
# puts EncryptedString.new('N', 13).decrypt_string
# puts EncryptedString.new('a', 13).decrypt_string
# puts EncryptedString.new('A', 13).decrypt_string
# puts EncryptedString.new('*', 13).decrypt_string

# test cases
puts EncryptedString.new("Nqn Ybirynpr", 13).decrypt_string       # => Ada Lovelace
puts EncryptedString.new("Tenpr Ubccre", 13).decrypt_string       # => Grace Hopper
puts EncryptedString.new("Nqryr Tbyqfgvar", 13).decrypt_string    # => Adele Goldstine
puts EncryptedString.new("Nyna Ghevat", 13).decrypt_string        # => Alan Turing
puts EncryptedString.new("Puneyrf Onoontr", 13).decrypt_string    # => Charles Babbage
puts EncryptedString.new("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv", 13).decrypt_string # => Abdullah MuhamEncryptedString.newKhwarizmi
puts EncryptedString.new("Wbua Ngnanfbss", 13).decrypt_string     # => John Atanasoff
puts EncryptedString.new("Ybvf Unvog", 13).decrypt_string         # => Lois Haibt
puts EncryptedString.new("Pynhqr Funaaba", 13).decrypt_string     # => Claude Shannon
puts EncryptedString.new("Fgrir Wbof", 13).decrypt_string         # => Steve Jobs
puts EncryptedString.new("Ovyy Tngrf", 13).decrypt_string         # => Bill Gates
puts EncryptedString.new("Gvz Orearef-Yrr", 13).decrypt_string    # => Tim Berners-Lee
puts EncryptedString.new("Fgrir Jbmavnx", 13).decrypt_string      # => Steve Wozniak
puts EncryptedString.new("Xbaenq Mhfr", 13).decrypt_string        # => Konrad Zuse
puts EncryptedString.new("Fve Nagbal Ubner", 13).decrypt_string   # => Sir Antony Hoare
puts EncryptedString.new("Zneiva Zvafxl", 13).decrypt_string      # => Marvin Minsky
puts EncryptedString.new("Lhxvuveb Zngfhzbgb", 13).decrypt_string # => Yukihiro Matsumoto
puts EncryptedString.new("Punllvz Fybavzfxv", 13).decrypt_string  # => Chayyim Slonimski
puts EncryptedString.new("Tregehqr Oynapu", 13).decrypt_string    # => Gertrude Blanch

# my tests with different rotations
puts EncryptedString.new("Fif Qtajqfhj", 5).decrypt_string       # => Ada Lovelace
puts EncryptedString.new("Vwhyh Mrev", 3).decrypt_string         # => Steve Jobs

# ---//---

# LS Solution

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end

=begin
Discussion
It's tempting to use a lookup table with a hash to solve this problem, but it's actually easier to use the description of Rot13 directly ("rotate" each character by 13), so that's what we will do.

Our program begins by setting up a constant Array that contains our encrypted list of pioneers.

We will use a method, rot13, to decrypt each name in the list, one at a time, and within that method, we use decipher_character to decrypt each character. We use String#each_char and Enumerable#reduce to iterate through the characters in encrypted_text, and construct the decrypted return value.

decipher_character uses a case statement that breaks the character decryption problem into 3 parts: the letters between A and M, the letters between N and Z, and everything else. Note that we check for both uppercase and lowercase letters because that's what we have to deal with. The first group is easy: we can shift the character 13 places forward ('A' becomes 'N', 'B' becomes 'O', ..., 'M' becomes 'Z'). We do this with String#ord and Integer#chr which convert a character to a numeric value and vice versa. Similarly, we do the same for the 2nd group, but this time we need to shift letters to the left by 13 places ('N' becomes 'A', 'O' becomes 'B', etc). Lastly, we can handle everything else by returning the value unchanged.

Once we have all the components in place, all we have to do is iterate through our list of encrypted names, and print each decrypted name.

Further Exploration
If there is anybody on this list whose name you don't recognize - and there probably are some - you owe it to yourself to look them up. Everybody should be aware of the pioneers in their chosen field, and computing is no different.

Most computers today use a character encoding called ASCII to store the basic set of characters such as latin letters, Arabic digits, and some punctuation. This encoding is convenient in that the lowercase letters all have consecutive values between 97 and 122, while the uppercase letters have consecutive values between 65 and 90. This makes implementation of Rot13 easy.

Not all computers use ASCII. Some mainframes use different schemes such as EBCDIC, which some IBM computers use. EBCDIC is unusual: the alphabetic characters are not all grouped together like in ASCII (see the linked page). How would this impact our implementation of this program if we were running this program on data that uses the EBCDIC representation?
=end
