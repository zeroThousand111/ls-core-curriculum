require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    removed_item = @list.shift

    assert_equal(removed_item, @todo1)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    removed_item = @list.pop

    assert_equal(removed_item, @todo3)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert_equal(true, @list.done?)
  end

  def test_raise_type_error_when_adding_to_todolist
    assert_raises(TypeError) do
      @list << "string object"
    end

    assert_raises(TypeError) do
      @list.add("string object")
    end
  end

  def test_shovels_todo_into_todolist
    list = TodoList.new("test list")
    list << @todo1
    assert_equal([@todo1], list.to_a)
  end

  def test_add_todo_into_todolist
    list = TodoList.new("test list")
    list.add(@todo1)
    assert_equal([@todo1], list.to_a)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(99) }
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(99) }
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(1)
    @list.mark_undone_at(2)
    
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
    assert_raises(IndexError) { @list.mark_done_at(99) }
  end

  def test_done!
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    @list.remove_at(0)

    assert_raises(IndexError) { @list.remove_at(99) }
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_mark_one_done
    @list.mark_done_at(0)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_mark_all_done
    @list.mark_all_done

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_each
    result_array = []
    returned_object = @list.each { |todo| result_array << todo.title }
    
    assert_equal(["Buy milk", "Clean room", "Go to gym"], result_array)
    assert_same(returned_object, @list)
  end

  def test_select
    selected = @list.select { |todo| false }

    assert_equal([], selected.to_a)
    refute_same(selected, @list)
  end

end