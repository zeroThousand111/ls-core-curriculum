def multisum(n)
  array = (1..n).to_a
  sum_array = array.select do |n|
    (n % 3 == 0) || (n % 5 == 0)
  end
  total = sum_array.sum
end

# tests
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168