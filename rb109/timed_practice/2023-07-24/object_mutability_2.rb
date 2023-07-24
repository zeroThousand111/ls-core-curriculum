def fix(value)
  value = value.upcase
  value.concat('!')
end

p s = 'hello'
p t = fix(s)