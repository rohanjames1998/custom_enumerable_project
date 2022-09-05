module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    # i serves as our index
    i = 0
   self.my_each do |ele|
    yield ele, i
    i += 1
   end
   return self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    selected_ele = []
    self.my_each do |ele|
      selected_ele << ele if yield ele
    end
    return selected_ele
  end

  # def my_all?
  #   # output = 0
  #   # if block_given?
  #   #   self.my_each do |ele|
  #   #     output += 1 if yield ele
  #   #   end
  #   # else
  #   #   # If no block given we check if all elements are truthy
  #   #   self.my_each do |ele|
  #   #     output += 1 if ele == true
  #   #   end
  #   # end

  #   # if output == self.length
  #   #   return true
  #   # else
  #   #   return false
  #   # end
  # end

  def my_all?
    if block_given?
      self.my_each do |ele|
        #If at any element we encounter a false output we just return false.
        if !yield ele
          return false
        end
      end
    else
      self.my_each do |ele|
        if ele == false
          return false
        end
      end
    end
    return true
  end

  def my_any?
    # If we have a block and any element returns truthy, we return true
    if block_given?
      self.my_each do |ele|
        if yield ele
          return true
        end
      end
      # If not block is given we check if any element is truthy and return true if any is.
    else
      self.my_each do |ele|
        if ele == true
          return true
        end
      end
    end
    return false
  end

  def my_none?
    if block_given?
      self.my_each do |ele|
        if yield ele
          return false
        end
      end
    else
      self.my_each do |ele|
       if ele
        return false
       end
      end
    end
    return true
  end




end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
     for i in self
      yield i
     end
    end
end
