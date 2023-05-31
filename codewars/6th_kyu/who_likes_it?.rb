# method
def likes(names)
  likes = names.size
  case likes
  when 0
    "no one likes this"
  when 1
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{likes - 2} others like this"
  end
end

# print tests
p likes([])
p likes(['Peter'])
p likes(['Jacob', 'Alex'])
p likes(['Max', 'John', 'Mark'])
p likes(['Alex', 'Jacob', 'Mark', 'Max'])

# tests

