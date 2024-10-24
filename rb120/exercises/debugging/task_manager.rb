=begin
Valentina is using a new task manager program she wrote. When interacting with her task manager, an error is raised that surprises her. Can you find the bug and fix it?

Hint

Error is :


=end

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    priority_tasks = tasks.select do |task|
      task.priority == :high
    end

    display(priority_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina') # create new TaskManager object

valentinas_tasks.add_task('pay bills', :high)   # add new task to @tasks
valentinas_tasks.add_task('read OOP book')      # add another new task to @tasks
valentinas_tasks.add_task('practice Ruby')      # add another new task to @tasks
valentinas_tasks.add_task('run 5k', :low)       # add another new task to @tasks

valentinas_tasks.complete_task('read OOP book') # delete 'read OOP book' from @tasks

valentinas_tasks.display_all_tasks              # display @tasks
valentinas_tasks.display_high_priority_tasks    # see below. exception raised

=begin
Error is from invoking the instance method `#display_high_priority_tasks`.

Output should be:

--------
[high  ] pay bills
--------

But instead:

task_manager.rb:43:in `display_high_priority_tasks': private method `select' called for nil:NilClass (NoMethodError)

    tasks = tasks.select do |task|
                 ^^^^^^^
        from task_manager.rb:84:in `<main>'

The error message says that is no method `select` for a NilClass object.  What and where is the `nil`?  `tasks` on line 45 must be `nil`.  We've unintentionally created a new local variable `tasks` here whose value is not yet assigned, hence the `nil`.

Is this also mutating @tasks by the expression `tasks = tasks.select`?  

The local variable `tasks` should be renamed to something else.  I went with `priority_tasks`.  Then this NEW array can be passed to `display` and @tasks isn't mutated and the getter method `tasks=` isn't invoked.

Another way of dealing with this would be to use `self`:

 def display_high_priority_tasks
    tasks = self.tasks.select do |task|
      task.priority == :high
    end

    display(tasks)
  end

=end
