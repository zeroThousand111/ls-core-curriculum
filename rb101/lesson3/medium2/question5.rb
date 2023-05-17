# original code

# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# new code that doesn't mutate arguments

def tricky_method_string(a_string_param)
  a_string_param = "pumpkinsrutabaga"
end

def tricky_method_array(an_array_param)
  an_array_param = ["pumpkins", "rutabaga"]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string = tricky_method_string(my_string)
my_array = tricky_method_array(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"