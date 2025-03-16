# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation - MY CODE HERE

  def add(todo)
    if todo.class == Todo
      self.todos << todo
    else
      puts "Can only add Todo objects"
    end
  end

  def <<(todo) # how to make this an alias of #add ?
    add(todo)
  end

  def size
    puts todos.size
  end

  def first
    puts todos.first
  end

  def last
    puts todos.last
  end

  def to_a
    p (array = todos.map do |todo|
      todo.title
    end)
  end

  def done?
    p todos.all? { |todo| todo.done?}
  end

  def item_at(index)
    if todos[index].nil?
      raise IndexError
    else
      todos[index]
    end
  end

  def mark_done_at(index)
    if todos[index].nil?
      raise IndexError
    else
      todos[index].done!
    end
  end

  def mark_undone_at(index)
    if todos[index].nil?
      raise IndexError
    else
      todos[index].undone!
    end
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    if todos[index].nil?
      raise IndexError
    else
      return todos.delete_at(index)
    end
  end

  def to_s
    puts "---- Today's Todos ----"
    todos.each { |todo| puts todo }
  end

  def each
    todos.each do |element|
      yield(element)
    end
    self # how to return the calling object
  end

  def select
    output = TodoList.new(self.title)
    each do |todo|
      output.add(todo) if yield(todo)
    end
    output
  end

  def find_by_title(string) # takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
    select { |todo| string == todo.title }.first
  end

  def all_done # returns new TodoList object containing only the done items
    select { |todo| todo.done? }
  end

  def all_not_done # 	returns new TodoList object containing only the not done items
    select { |todo| !todo.done? }
  end

  def mark_done(string) # takes a string as argument, and marks the first Todo object that matches the argument as done.
    select { |todo| string == todo.title }.todos.first.done!
  end

  def mark_all_done # mark every todo as done
    each { |todo| todo.done! }
  end

  def mark_all_undone # mark every todo as not done
    each { |todo| todo.undone! }
  end

  protected

  attr_accessor :todos

end

# ---- ASSIGNMENT 12 BELOW - ADD MORE METHODS THAT USE BLOCKS -----

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

p list.find_by_title("") # => nil
p list.find_by_title("Buy milk") # => should return a Todo object

# todo1.done!
# p list.all_done # => should return a new TodoList object with one Todo object in @todos array
# p list.all_not_done # => should return a new TodoList object with two Todo object in @todos array

# list.mark_done("Clean room")
# puts list # now both Buy milk and Clean room should be marked as done

# list.mark_all_done
# puts list # now all items should be marked as done

# list.mark_all_undone
# puts list # now all items should be marked as undone


# ---- ASSIGNMENT 11 STEPs 1 AND 2 BELOW - ADD #SELECT METHOD -----

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# todo1.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# ---- ASSIGNMENT 10 AND 11 STEP 3 BELOW - ADD #EACH METHOD -----

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# p (list.each do |todo|
#   puts todo                   # calls Todo#to_s
# end)

=begin
[ ] Buy milk
[ ] Clean room
[ ] Go to gym
=end

# ---- ASSIGNMENT 9 BELOW - BUILD TODOLIST CLASS -----

# # given
# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add

# # # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # # last
# list.last                       # returns todo3, which is the last item in the list

# # #to_a
# list.to_a                      # returns an array of all items in the list

# #done?
# list.done?                     # returns true if all todos in the list are done, otherwise false

# # # ---- Retrieving an item in the list ----

# # # item_at
# # list.item_at                    # raises ArgumentError
# puts list.item_at(1)              # returns 2nd item in list (zero based index)
# # list.item_at(100)               # raises IndexError

# # # ---- Marking items in the list -----

# # # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)              # marks the 2nd item as done
# puts list.item_at(1)
# # list.mark_done_at(100)          # raises IndexError

# # # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)            # marks the 2nd item as not done,
# puts list.item_at(1)
# # list.mark_undone_at(100)        # raises IndexError

# # # done!
# list.done!                        # marks all items as done

# # # ---- Deleting from the list -----

# # # shift
# # p list.shift                      # removes and returns the first item in list

# # # pop
# # p list.pop                        # removes and returns the last item in list

# # # remove_at
# # list.remove_at                  # raises ArgumentError
# # p list.remove_at(1)               # removes and returns the 2nd item
# # list.remove_at(100)             # raises IndexError

# # # ---- Outputting the list -----

# # # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym