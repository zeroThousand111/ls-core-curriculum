arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p arr.map { |sub_array| sub_array.sort }

# => ["a", "b", "c"], [1, 2, 3], ["black", "blue", "green"]]