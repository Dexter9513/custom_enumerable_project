module Enumerable
  # Your code goes here
  def my_each
    for value in self do
      yield value
    end
    self
  end

  def my_each_with_index
    i = 0
    for value in self do
      yield value, i
      i += 1
    end
    self
  end

  def my_select
    to_return = []
    for value in self do
      to_return << value if yield value
    end
    to_return
  end

  def my_all?
    for value in self do
      return false unless yield value
    end
    true
  end

  def my_any?
    for value in self do
      return true if yield value
    end
    false
  end

  def my_none?
    for value in self do
      return false if yield value
    end
    true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    for value in self do
      count += 1 if yield value
    end
    count
  end

  def my_map
    to_return = []
    for value in self do
      to_return << yield(value)
    end
    to_return
  end

  def my_inject(initial)
    to_return = initial
    for value in self do
      to_return = yield to_return, value
    end
    to_return
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  include Enumerable
end
