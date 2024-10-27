=begin
A circular buffer is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular buffer, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the buffer the longest.

This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the buffer requires getting rid of an existing object; with a circular buffer, the object that has been in the buffer the longest is discarded and replaced by the new object.

Assuming we have a circular buffer with room for 3 objects, the circular buffer looks and acts like this:

P1	P2	P3	Comments
            All positions are initially empty
1			      Add 1 to the buffer
1	  2		    Add 2 to the buffer
    2		    Remove oldest item from the buffer (1)
    2	  3	  Add 3 to the buffer
4	  2	  3	  Add 4 to the buffer, buffer is now full
4		    3	  Remove oldest item from the buffer (2)
4	  5	  3	  Add 5 to the buffer, buffer is full again
4	  5	  6	  Add 6 to the buffer, replaces oldest element (3)
7	  5	  6	  Add 7 to the buffer, replaces oldest element (4)
7		    6	  Remove oldest item from the buffer (5)
7			      Remove oldest item from the buffer (6)
            Remove oldest item from the buffer (7)
            Remove non-existent item from the buffer (nil)

Your task is to write a CircularBuffer class that implements a circular buffer for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularBuffer::new, and should provide the following methods:

- put to add an object to the buffer
- get to remove (and return) the oldest object in the buffer. It should return nil if the buffer is empty.

You may assume that none of the values stored in the buffer are nil (however, nil may be used to designate empty spots in the buffer).

# MY NOTES
## DATA STRUCTURE
- what data structure is the buffer?  I think a customised Array object, so I'll use the Array class as a collaborator object for CircularBuffer's one instance variable, which I will name @buffer
- the buffer is a fixed size.  You can't add new elements to it if it is full.  So I should encapsulate CircularBuffer objects so that nothing can access the @buffer instance variable and utilise an Array class method (e.g. Array#push) I will make the getter and setter methods for @buffer private.

## HOW TO "KNOW" WHICH ELEMENTS ARE NEWEST AND OLDEST?
- how to "know" which elements are the oldest and newest in the buffer?  
  - Use index order i.e. left-most objects are oldest? No.
  - Give each new element an @entry_order attribute.  What is the collaborator object to this?
    - An Integer.  This instance variable increments each time a new element is added to the buffer. Each new object gets an increasing number value.  This goes on infinitly.  Sounds like a bit of a drain on resources though if it was used for a long-term structure in a program.
    - An Array.  We "know" entry order by position in the @order array.  If we add new objects to the end of the array (right position), then the left-most object is the oldest.  When we remove an item from the buffer, we identify it as the oldest as the left-most object in the @entry_order array and then take action on the @buffer Array.
  - 
- 
## "WHERE" TO ADD NEW ELEMENTS IN THE BUFFER?
- in what index position should new elements be added to?
- the definition of a circular buffer (wikipedia) says that it doesn't matter
- if we are tracking @entry_order, then it doesn't matter

=end
require 'pry'
require 'pry-byebug'

class CircularBuffer
  def initialize(size)
    @buffer = Array.new(size)
    @entry_order = []
  end

  def put(new_element)
    empty_position = find_first_empty_space

    if empty_position # if buffer is NOT full, i.e. empty_position is an Integer and not nil
      buffer[empty_position] = new_element
      entry_order << new_element
    else # if buffer IS full, i.e. return from find_empty_space is falsy (nil) need to remove an element first
      removed_object = buffer(find_and_remove_oldest_element_from_entry_order)
      buffer[buffer.index(removed_object)] = new_element
      entry_order << new_element
    end
  end

  def get # removes and returns left-most element in @entry_order
    object = find_and_remove_oldest_element_from_entry_order
    buffer[buffer.index(object)] = nil # replace buffer position with a nil object
    object # return removed object
  end

  # helpful TEMPORARY output method in testing
  # def to_s
  #   "@buffer is #{buffer} and @entry_order is #{entry_order}"
  # end

  private

  attr_accessor :buffer, :entry_order

  def find_first_empty_space # returns first empty space or nil if buffer full
    empty_index = nil
    buffer.each_with_index do |element, index|
      # binding.pry
      if element.nil?
        # puts "I've found a nil!"
        empty_index = index
        break
      end
    end
    empty_index
  end

  def find_and_remove_oldest_element_from_entry_order
    entry_order.shift
  end
end

# My tests with additional output

buffer = CircularBuffer.new(3)
puts buffer.get == nil
p buffer

buffer.put(1)
p buffer
buffer.put(2)
p buffer
puts buffer.get == 1
p buffer

buffer.put(3)
p buffer
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
p buffer
buffer.put(6) # issue here with adding new element when buffer is full

# buffer.put(7)
# puts buffer.get == 5
# puts buffer.get == 6
# puts buffer.get == 7
# puts buffer.get == nil

# buffer = CircularBuffer.new(4)
# puts buffer.get == nil

# buffer.put(1)
# buffer.put(2)
# puts buffer.get == 1

# buffer.put(3)
# buffer.put(4)
# puts buffer.get == 2

# buffer.put(5)
# buffer.put(6)
# buffer.put(7)
# puts buffer.get == 4
# puts buffer.get == 5
# puts buffer.get == 6
# puts buffer.get == 7
# puts buffer.get == nil

# Tests to ensure circular buffer class working as intended:
