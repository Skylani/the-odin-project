def reverser
  array = yield.split
  for i in 0..array.length-1
    array[i] = array[i].reverse
  end
  array.join(' ')
end

def adder(num = 1)
  yield + num
end

def repeater(num = 1)
  num.times{
    yield
  }
end