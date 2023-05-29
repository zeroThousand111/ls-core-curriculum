# method
def find_short(s)
    l = 100
    array = s.split(" ")
    array.each { |word| word.length < l ? l = word.length : l }
    return l # l: length of the shortest word
end

# print tests
# p find_short("bitcoin take over the world maybe who knows perhaps")
# p find_short("lets talk about javascript the best language")

# tests
p find_short("bitcoin take over the world maybe who knows perhaps") == 3
p find_short("lets talk about javascript the best language") == 3
