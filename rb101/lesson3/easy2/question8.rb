advice = "Few things in life are as important as house training your pet dinosaur."
p advice.index('house')

p advice.slice("Few things in life are as important as ")
puts advice

p advice.slice!(0, advice.index('house'))



puts advice