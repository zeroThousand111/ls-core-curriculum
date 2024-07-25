=begin
56. Find the Nexus of the Codewars Universe
(​https://www.codewars.com/kata/5453dce502949307cf000bff​)
6 kyu

Not to brag, but I recently became the nexus of the Codewars universe! My honor and my rank were the same number. I cried a little.
  
Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

# UNDERSTAND THE PROBLEM
## INPUT: a hash of rank keys and honor values
## OUTPUT: an integer, corresponding to the rank of the median user, or the user closest to the median
## RULES
### EXPLICIT REQUIREMENTS
  - a method:
  - return the rank of the user that has the closest value honor to their rank
  - in other words the difference between rank and honor is closest to zero
  - in cases of ties, return the rank of the user lowest rank (numerical value)
### IMPLICIT REQUIREMENTS
  - the differences between rank and honor can be positive or negative numbers
# EXAMPLES


Example
rank honor
users={ 1 => 93, 10 => 55, 15 => 30, 20 => 19, 23 => 11, 30 => 2}
p nexus({1 => 3, 3 => 3, 5 => 1}) == 3 # because rank == honor
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3 # because 3=>4 difference of 1
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2 # because difference of 1 and has a lower rank than 3=>4 pair

# DATA STRUCTURES
INPUT: a hash of rank-honor pairs
{ rank=>honor}
OUTPUT: an integer
INTERMEDIATE: 
- an hash of differences squared
i.e. {rank=>difference**2}
or {rank=>((rank-honor)**2)

# ALGORITHM
1. Create a hash of rank-difference pairs
* CREATE an empty difference hash
* MOVE through the input hash from first pair to the last
  + use #each 
* SHOVEL a new key-value pair to the empty difference hash where key is rank and value is (rank-honor)**2
2. Return the rank that has lowest difference value in the above new hash
* FIND the pair with the lowest difference value:
  + use Enumerable#min
  + use #first to get the rank value from the returned array
=end

def nexus(input_hash)
  difference_hash = {}
  input_hash.each do |rank, honor|
    difference_hash[rank] = (rank-honor)**2
  end
  difference_hash.min_by { |k, v| v}.first
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2