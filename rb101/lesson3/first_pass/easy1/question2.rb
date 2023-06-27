def print_answer(name)
  name == 'Jim' ? "This is Jim!" : "This is not Jim..."
end

user_name = 'Jim'
puts print_answer(user_name)
puts print_answer('Jill')
