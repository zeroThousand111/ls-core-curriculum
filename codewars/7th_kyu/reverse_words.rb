def reverse_words(str)
  array = str.split(/(\s+)/)
  array.map! { |word| word.reverse}
  array.join
end

# print tests
p reverse_words('The quick brown fox jumps over the lazy dog.')
p reverse_words('apple')
p reverse_words('a b c d')
p reverse_words('double  spaced  words')

# tests
p reverse_words('The quick brown fox jumps over the lazy dog.') == 'ehT kciuq nworb xof spmuj revo eht yzal .god'
p reverse_words('apple') == 'elppa'
p reverse_words('a b c d') == 'a b c d'
p reverse_words('double  spaced  words') == 'elbuod  decaps  sdrow'