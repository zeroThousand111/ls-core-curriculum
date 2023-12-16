arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

sorted_arr = arr.sort_by do | sub_array |
  sub_array.select do | element | 
    element.odd?
  end
end

p sorted_arr

# => [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]