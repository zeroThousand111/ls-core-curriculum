# SOLUTION 1 - FIRST DRAFT - WITHOUT HINTS JUST WITH TEST SUITE
class Element
  attr_reader :datum

  def initialize(datum, next_element=nil)
    @datum = datum
    @next_element = next_element
  end

  def next
    @next_element
  end

  def tail?
    self.next.nil?
  end

  # def ==(other) # my own method for testing
  #   self.datum == other.datum && self.next_element == other.next_element
  # end
end

class SimpleLinkedList
  include Enumerable

  attr_accessor :head

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    return new_list if array.nil?

    array.reverse_each do |value|
      new_list.push(value)
    end
    new_list
  end

  def initialize
    @head = nil
  end

  def size
    return 0 if self.empty?
    self.count # using Enumerable#count
  end

  def empty?
    head.nil?
  end

  def peek
    return nil if self.empty?
    head.datum
  end

  def push(datum)
    # create a new Element object
    new_element = Element.new(datum, head)
    # change head to pushed
    self.head = new_element
  end

  def pop 
    # create temporary head element
    temp_head = head
    # set new head of list to the next element
    self.head = temp_head.next
    # return datum of old head
    temp_head.datum
  end

  def to_a
    array = []
    return array if self.empty?

    self.each do |element|
      array << element.datum
    end

    array
  end

  def reverse
    # create an array from SimpleLinkedList object
    temp_array = self.to_a
    # reverse order of data in array with Array#reverse
    temp_array.reverse!
    # transform reversed array into a NEW SimpleLinkedList
    SimpleLinkedList.from_a(temp_array)
  end
  
  private

  # #each method to move through the linked from first Element to the last and return head Element - this enables use of Enumerable class methods such as #count

  def each
    current_element = head

    loop do
      yield(current_element)
      break if current_element.next.nil?
      current_element = current_element.next
    end

    head
  end


end

# My Tests

# element1 = Element.new(1)
# element2 = Element.new(2, element1)
# puts element1.datum == 1
# puts element2.datum == 2
# p element1.tail? == true
# p element2.tail? == false

test_list = SimpleLinkedList.new
# p test_list.empty? == true
# p test_list.size == 0
test_list.push(1)
test_list.push(2)
# p test_list.peek #=> #<Element>
# p test_list.head
# test_list.each { |element| puts element.datum }
# p test_list.count
# p test_list.size == 2

p test_list.to_a
# p SimpleLinkedList.new.to_a
p test_list.reverse.to_a
