=begin
String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.
=end


def shout_out_to(name) # name is 'you'

  name = name.chars.each { |c| c.upcase! }.join # return will be calling object itself

  puts 'HEY ' + name
end

def shout_out_to(name) # name is 'you'

  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'