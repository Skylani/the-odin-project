def add a,b
  a+b
end

def subtract a,b
  a-b
end

def sum numbers
  numbers.inject(0) { |sum,number| sum+number }
end

def multiply numbers
  numbers.inject(1) { |product,number| product*number }
end

def power number, exponent
  product = 1
  exponent.times {
    product *= number
  }
  product
end

def factorial number
  if (number == 0)
    1
  else
    product = 1
    for i in 1..number
      product *= i
    end
    product
  end

end