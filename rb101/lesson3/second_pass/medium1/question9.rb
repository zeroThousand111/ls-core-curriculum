def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# what is the return value of 
p bar(foo)

# return value from foo is "yes", which is passed as an argument to the method bar
# ternary conditional statement on line 6 evaluates to false, so the return is "no"