arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map do |sub_array| 
  sub_array.sort do | a, b |
    b <=> a
  end
end)

# => ["a", "b", "c"], [1, 2, 3], ["black", "blue", "green"]]