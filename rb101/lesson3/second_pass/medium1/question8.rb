def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# what is the result of the following call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# rps(paper, "rock") so paper wins