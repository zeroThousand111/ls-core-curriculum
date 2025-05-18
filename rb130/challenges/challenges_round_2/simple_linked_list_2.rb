# solution 1 - first draft

class Element
  attr_reader :datum

  def initialize(datum, next_object=nil)
    @datum = datum
    @next_object = next_object
  end

  def next
    next_object
  end

  def tail?
    self.next.nil?
  end

  private

  attr_reader :next_object
end

class SimpleLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    return new_list if array.nil? || array.empty?
    array.reverse_each { |element| new_list.push(element) }
    new_list
  end

  def to_a
    array = []
    return array if empty?
    each { |element| array << element.datum }
    array
  end

  def push(value)
    element = Element.new(value, head)
    @head = element
  end

  def pop
    output = head.datum
    self.head = head.next
    output
  end

  def size
    size = 0
    return size if empty?
    each { size += 1 }
    size
  end

  def empty?
    head.nil?
  end

  def peek
    return nil if empty?
    head.datum
  end

  def reverse
    array = to_a.reverse
    SimpleLinkedList.from_a(array)
  end

  private

  def each
    current_element = head
    loop do
      yield(current_element)
      break if current_element.next.nil?
      current_element = current_element.next
    end
  end
end

# My tests

# test_list = SimpleLinkedList.new
# test_list.push(1)
# test_list.push(2)
# test_list.push(3)
# p test_list
# p test_list.size
# p test_list.each { |element| puts element.datum }
# p test_list.peek # => 3
# p test_list.pop # => 3
# p test_list.peek # => 2

# list_from_array = SimpleLinkedList.from_a([0, 1, 2, 3])
# p list_from_array.peek # => 3
# p list_from_array.size # => 4
