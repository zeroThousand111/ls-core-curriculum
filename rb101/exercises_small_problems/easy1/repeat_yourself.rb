=begin
expected output:
Hello
Hello
Hello
=end

def repeat(string, number)
  number.times {puts string}
end

repeat('Hello', 3)
repeat('Hi, there!', 5)
