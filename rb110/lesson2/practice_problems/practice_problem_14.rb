hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each do | key, value |
  if value[:type] == 'fruit'
    arr.push(value[:colors])
    arr[-1].map { |e| e.capitalize! }
  elsif value[:type] == 'vegetable'
    arr << value[:size]
    arr[-1].upcase!
  end
end

p arr
# =>[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]