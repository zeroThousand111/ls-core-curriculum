=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. 

For example:
domain_name("http://github.com/carbonfive/raygun") == "github" 
domain_name("http://www.zombie-bites.com") == "zombie-bites" 
domain_name("https://www.cnet.com") == "cnet"

# UNDERSTAND THE PROBLEM

This is probably a problem that requires a short but complicated regex solution?  

Or identify the substring between the last full stop "." and a preceding full stop or double forward slash "//"

# UNDERSTAND THE PROBLEM
## INPUT: a string, a URL 
## OUTPUT: the domain name component of the URL
## RULES
### Explicit requirements:
  - a method
  - when given a URL, return just the domain name as a string
### Implicit requirements:
  - return a NEW string
  - what is the "domain name"?
    - IF the string starts with "http://" or "https://", the string between "//" and the next "." OR
    - IF the string starts with "www", the string between the first "." and the next "." 

# EXAMPLES / TEST CASES
p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"

# DATA STRUCTURES

Strings
Maybe an array of characters?

# ALGORITHM

* DETERMINE if the string starts with "htt" or "www"
* ACT on the determination

FORK 1 - "htt"
* IDENTIFY the index of the string that comes after "//"
    - first_index
  + MOVE through the url string characters, character by character
  + TRANSFORM into an array of characters, using #chars
  + use each_with_index
  + IF char == "/" && char[index - 1] == "/", then first_index == index + 1
  + IF char == "." then last_index
* IDENTIFY the index of the string that comes before the next "."
    - last_index
  + IF char == "." then last_index
* JOIN subarray first_index..last_index
* RETURN joined substring

FORK 2 - "www"
* IDENTIFY the index of the string that comes after "."
    - first_index
  + MOVE through the url string characters, character by character
  + TRANSFORM into an array of characters, using #chars
  + use each_with_index
  + Create a switch local variable
    - first_full_stop_found = false
  + IF char == "." && switch is false, then first_index is index + 1
  
* IDENTIFY the index of the string that comes before the next "."
    - last_index
  + IF char == "." && switch is true, then last_index is index - 1
* JOIN subarray first_index..last_index
* RETURN joined substring

=end
require "pry"
require "pry-byebug"

def www(url)
  first_index = nil
  last_index = nil
  first_full_stop_found = false
  array = url.chars
  array.each_with_index do |char, index|
    if char == "." && first_full_stop_found == false
      first_index = index + 1
      first_full_stop_found = true
    end
    
    if char == "." && first_full_stop_found == true
      last_index = index - 1
    end
    
  end
  
  array[first_index..last_index].join
end

def htt(url)
  first_index = nil
  last_index = nil
  array = url.chars
  array.each_with_index do |char, index|
    if array[index - 2] == "/" && array[index - 1] == "/"
      first_index = index
    end
    if char == "."
      last_index = index - 1
      break
    end
    # binding.pry
  end
  
  array[first_index..last_index].join
end

def domain_name(url)
    if url.start_with?("htt")
      return htt(url)
    elsif url.start_with?("www")
      return www(url)
    end
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"