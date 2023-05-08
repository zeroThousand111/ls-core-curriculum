string = "string"

# basic heredoc
basic = <<BASIC

This is a basic heredoc.
  I can write.
    Over multiple lines.
(But if I indent the terminator,
it doesn't work!)

BASIC

# indented terminator heredoc
indented = <<-INDENT
This is an indented heredoc.
  And it is OK for me
    to indent the terminator.
I can also use #{string} interpolation.
  INDENT

# squiggly heredoc
squiggly = <<~SQUIGGLY

    This is a squiggly heredoc.
     It strips any leading white space
      on the first line from all lines.
      #{string} test
SQUIGGLY

# percent string literal
percent_string_literal = %Q(

  This is a heredoc
    that has been created
      from a percent string literal

)

# double quotes heredoc allows string interpolation
double_quotes = <<"DOUBLE"

  A double quoted heredoc can
    also use #{string} interpolation.
      One plus one is #{1 + 1}
    
DOUBLE

# single quotes is the same as a regular heredoc
single_quotes =<<'SINGLE'
  This is a single quote heredoc
    I can use special characters without them
meaning anything special #{no string interpolation here}
  one plus one is #{1 + 1}
  
SINGLE

puts basic
puts indented
puts squiggly
puts percent_string_literal
puts double_quotes
puts single_quotes