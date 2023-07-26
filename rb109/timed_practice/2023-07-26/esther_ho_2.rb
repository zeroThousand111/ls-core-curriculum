def rain?
  puts [true, false].sample
end

message = if rain?
            "It's raining!"
          else
            "No rain today."
          end
          
puts message