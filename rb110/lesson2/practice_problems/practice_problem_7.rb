a = 2
b = [5, 8]
arr = [a, b]    # => [2, [5, 8]]

arr[0] += 2     # => [4, [5, 8]] # reassignment is NOT mutating
arr[1][0] -= a  # => [4, [3, 8]] # element assignment IS mutating

p a             # => 2
p b             # => [3, 8]

p arr