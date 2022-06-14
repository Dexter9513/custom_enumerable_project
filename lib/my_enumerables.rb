module Enumerable
  # Your code goes here
  def my_each
    0.upto(self.length - 1) do |i|
      value = self[i]
      yield value
    end
    self
  end
  
  def my_each_with_index
    0.upto(self.length - 1) do |i|
      value = self[i]
      yield value, i
    end
    self
  end

  def my_select
    to_return = []
    0.upto(self.length - 1) do |i|
      value = self[i]
      to_return << value if yield value
    end
    to_return
  end

  def my_all?
    0.upto(self.length - 1) do |i|
      value = self[i]
      return false unless yield value
    end
    true
  end

  def my_any?
    0.upto(self.length - 1) do |i|
      value = self[i]
      return true if yield value
    end
    false
  end

  def my_none?
    0.upto(self.length - 1) do |i|
      value = self[i]
      return false if yield value
    end
    true
  end

  def my_count
    return self.length unless block_given?
    i = 0
    count = 0
    self.length.times do
      value = self[i]
      count += 1 if yield value
      i -= 1
    end
    count
  end

  def my_map
    to_return = []
    0.upto(self.length - 1) do |i|
      value = self[i]
      to_return << yield(value)
    end
    to_return
  end

  def my_inject(initial)
    to_return = initial
    0.upto(self.length - 1) do |i|
      value = self[i]
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
