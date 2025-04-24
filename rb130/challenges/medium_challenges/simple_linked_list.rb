# SOLUTION 1 - FIRST DRAFT - WITHOUT HINTS JUST WITH TEST SUITE
class Element
  attr_reader :datum, :next_element

  def initialize(datum, next_element=nil)
    @datum = datum
    @next_element = next_element
  end

  def tail?
    self.next_element.nil?
  end

  def next
    next_element
  end

  # def ==(other) # my own method for testing
  #   self.datum == other.datum && self.next_element == other.next_element
  # end
end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def head
    return nil if self.empty?
    list.first
  end

  def peek
    return nil if self.empty?
    list.first.datum
  end

  def push(datum)
    list.prepend(Element.new(datum, head))
  end

  def pop 
    
  end
  



end

# My Tests

element1 = Element.new(1)
element2 = Element.new(2, element1)
puts element1.datum == 1
puts element2.datum == 2
p element1.tail? == true
p element2.tail? == false

test_list = SimpleLinkedList.new
p test_list.empty? == true
p test_list.size == 0
test_list.push(element1)
p test_list.size == 1
p test_list.peek #=> #<Element>
# p test_list.head == element1
