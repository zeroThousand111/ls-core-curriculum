# SOLUTION 1 - FIRST DRAFT JUST USING TEST SUITE AND NO HINTS
# I consciously borrowed a lot of Array class methods for use in the CustomSet instance methods

# class CustomSet
#   attr_accessor :set

#   def initialize(set=[])
#     @set = set
#   end

#   def empty?
#     set.empty?
#   end

#   def contains?(object)
#     set.include?(object)
#   end

#   def subset?(other_set) # self is a subset of other set
#     set.all? { |value| other_set.set.include?(value) }
#   end

#   def disjoint?(other_set) # Are any of the elements in the current set present in the other set?  return false if yes, true otherwise

#     # could use Array#intersect in refactor
#     return false if set.any? { |value| other_set.set.include?(value)}
#     true
#   end

#   def eql?(other_set)
#     # account for duplicate values in either @set array
#     # return false if unique @set arrays are not the same size
#     return false if set.uniq.size != other_set.set.uniq.size
    
#     # Are any of the elements in the current set missing in the other set? return false if yes, true if none missing
#     set.uniq.all? { |value| other_set.set.uniq.include?(value) }
#   end

#   def ==(other)
#     self.eql?(other) # using CustomSet#eql? method above
#   end

#   def add(new)
#     self.set.push(new)
#     self
#   end

#   def intersection(other_set)
#     CustomSet.new(set.intersection(other_set.set))
#   end

#   def difference(other_set)
#     CustomSet.new(set.difference(other_set.set))
#   end

#   def union(other_set)
#     CustomSet.new(set.union(other_set.set))
#   end
# end

# SOLUTION 2 - SECOND DRAFT - REFACTOR

# class CustomSet
#   attr_accessor :set

#   def initialize(set=[])
#     @set = set
#   end

#   def empty?
#     set.empty?
#   end

#   def contains?(object)
#     set.include?(object)
#   end

#   def subset?(other)
#     set.all? { |value| other.set.include?(value) }
#   end

#   def disjoint?(other)
#     !set.intersect?(other.set)
#   end

#   def eql?(other)
#     return false if set.uniq.size != other.set.uniq.size
#     set.uniq.all? { |value| other.set.uniq.include?(value) }
#   end

#   def ==(other)
#     self.eql?(other)
#   end

#   def add(new)
#     self.set.push(new) unless contains?(new)
#     self
#   end

#   def intersection(other)
#     CustomSet.new(set.intersection(other.set))
#   end

#   def difference(other)
#     CustomSet.new(set.difference(other.set))
#   end

#   def union(other)
#     CustomSet.new(set.union(other.set))
#   end
# end

# SOLUTION 3 - THIRD DRAFT - IMPLEMENT LSBOT RECOMMENDATIONS

class CustomSet
  def initialize(set=[])
    @set = set.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(object)
    set.include?(object)
  end

  def subset?(other)
    set.all? { |value| other.set.include?(value) }
  end

  def disjoint?(other)
    !set.intersect?(other.set)
  end

  def eql?(other)
    return false if set.size != other.set.size
    set.all? { |value| other.set.include?(value) }
  end

  def ==(other)
    self.eql?(other)
  end

  def add(new)
    set.push(new) unless contains?(new)
    self
  end

  def intersection(other)
    CustomSet.new(set.intersection(other.set))
  end

  def difference(other)
    CustomSet.new(set.difference(other.set))
  end

  def union(other)
    CustomSet.new(set.union(other.set))
  end

  protected
  attr_accessor :set
end

# MY TESTS

# set1 = CustomSet.new([1, 2, 2, 1])
# set2 = CustomSet.new([1, 2])
# p set1.eql?(set2) == true
# set2.add(3)
# p set2
# set3 = CustomSet.new([1, 2, 4]).add(3)
# p set3
# p CustomSet.new([1, 2, 4]).add(3) == CustomSet.new([1, 2, 4, 3])