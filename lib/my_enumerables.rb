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
    # If block is given we check if any element returns truthy. If it does we return false
    if block_given?
      self.my_each do |ele|
        if yield ele
          return false
        end
      end
      # When no block is given we check if any element returns truthy. If it does we return false
    else
      self.my_each do |ele|
       if ele
        return false
       end
      end
    end
    #  Else we return true
    return true
  end

  def my_count
    count = 0

    if block_given?
      # If block is given we check if any element returns truthy. If it does we increment count by 1
      self.my_each do |ele|
        if yield ele
          count += 1
        end
      end
      return count
      # If no block is given we return number of elements.
    else
     return self.length
    end
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    #  If block is given we first process ele (by block given by user) then push that into output array.
    output = []
    self.my_each do |ele|
       processed_ele = yield ele
       output << processed_ele
    end
    return output
  end

  def my_inject(initial_operand=self.first)
    if block_given?
      self.my_each do |ele|
       initial_operand = yield initial_operand, ele
      end
    end
     initial_operand
  end





end

class Array
  def my_each
    return to_enum(:my_each) unless block_given?
     for i in self
      yield i
     end
    end
end
