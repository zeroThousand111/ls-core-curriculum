hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do | sub_array |
  sub_array.each do | word |
    word.chars.each do | letter |
      puts letter if letter.match?(/[aeiou]/)
    end
  end
end