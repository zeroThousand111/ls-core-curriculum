=begin
________________________________________________________________________________
*****Problem*****

You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
________________________________________________________________________________

=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me("hello world") # "olleh dlrow"

string = "hi there"
p spin_me(string)
p string # hi there i.e. the method is NOT destructive

# Why?  
# Because the input string `str` has Array#split invoked upon it on line 19, creating an array of words.  This is a new object.  These words have the mutating String#reverse! method invoked upon them, not the input string `str`.