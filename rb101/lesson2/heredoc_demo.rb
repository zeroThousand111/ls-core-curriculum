# basic heredoc
basic = <<BASIC
This is a basic heredoc.
I can write.
Over multiple lines.
BASIC

# indented heredoc
indented = <<-INDENT
This is an indented heredoc.
To be honest I'm not sure.
What the difference is.
INDENT

# squiggly heredoc
squiggly = <<~SQUIGGLY
This is a squiggly heredoc.
I can see why they call it that.
But I don't know what it does.
SQUIGGLY

puts basic
puts ""
puts indented
puts ""
puts squiggly