arr = ['10', '11', '9', '7', '8']

sorted = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p arr
p sorted