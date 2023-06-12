def test(str)
  str += '!'
  str.downcase!
	p str
end

test_str = 'Written Assessment'
test(test_str)
puts test_str