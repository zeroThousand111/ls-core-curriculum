def count_by(x, n)
    array = []
    n.times { |i| array << i + 1 }
    new_array = array.map { |e| e * x }
    new_array
end

# print tests
p count_by(1, 5)
p count_by(2, 5)
p count_by(3, 5)
p count_by(50, 5)
p count_by(100, 5)

# tests
p count_by(1, 5) == [1, 2, 3, 4, 5]
p count_by(2, 5) == [2, 4, 6, 8, 10]
p count_by(3, 5) == [3, 6, 9, 12, 15]
p count_by(50, 5) == [50, 100, 150, 200, 250]
p count_by(100, 5) == [100, 200, 300, 400, 500]