def has_lab?(string)
  if string.match(/lab/)
    puts "Yes, there is 'lab'!"
  else
    puts "No, there isn't 'lab'!"
  end
end

has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")