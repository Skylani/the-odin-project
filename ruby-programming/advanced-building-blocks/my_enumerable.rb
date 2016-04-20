module Enumerable

  def my_each
    myself = self.to_a
    for i in 0..myself.size-1 do
      yield myself[i]
    end
  end

  def my_each_with_index
    for i in 0..self.size-1 do
      yield self[i],i
    end
  end

  def my_select
    array = []
    self.my_each do |v|
      array << v if yield v
    end
    array
  end

  def my_all?
    self.my_each do |v|
      if block_given?
        return false unless yield v
      else
        return false unless v
      end
    end
    return true
  end

  def my_any?
    self.my_each do |v|
      if block_given?
        return true if yield v
      else
        return true if v
      end
    end
    return false
  end

  def my_none?
    self.my_each do |v|
      if block_given?
        return false if yield v
      else
        return false if v
      end
    end
    return true
  end

  def my_count *args
    if args.size < 1
      return self.size
    else
      array = self.my_select {|v| v==args[0]}
      return array.size
    end
  end

  # def my_map
  #   array = []
  #   self.my_each do |v|
  #     array << (yield v)
  #   end
  #   array
  # end

  def my_map *proc
    array = []
    if block_given?
      self.my_each do |v|
        array << (yield v)
      end
    else
      self.my_each do |v|
        array << (proc[0].call v)
      end
    end
    array
  end

  def my_inject memo
    self.my_each do |v|
      memo = (yield memo,v)
    end
    memo
  end

  def multiply_els
    self.my_inject(1) {|product,num| product*num}
  end

end