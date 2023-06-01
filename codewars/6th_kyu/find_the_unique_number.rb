def find_uniq(arr)
    hash = arr.tally
    inverted_hash = hash.invert
    inverted_hash[1]
end

# print tests
p find_uniq([1,1,1,1,0])
p find_uniq([ 1, 1, 1, 2, 1, 1 ])
p find_uniq([ 0, 0, 0.55, 0, 0 ])

# tests

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55