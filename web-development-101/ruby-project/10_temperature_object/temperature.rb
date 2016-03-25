class Temperature
  def initialize(degree={})
    if degree[:f]
      @fahrenheit = degree[:f]
      @celsius = Temperature.ftoc @fahrenheit
    else
      @celsius = degree[:c]
      @fahrenheit = Temperature.ctof @celsius
    end
  end

  def self.ftoc f
    (f-32)*5/9.0 # use 9.0 so that result is float
  end

  def self.ctof c
    c*9.0/5+32
  end

  def in_fahrenheit
    @fahrenheit
  end

  def in_celsius
    @celsius
  end


#################################
# Factory design pattern

  def self.from_celsius degree
    Temperature.new(:c => degree)
  end

  def self.from_fahrenheit degree
    Temperature.new(:f => degree)
  end

#################################
end


#################################
# subclass design

class Celsius < Temperature
  def initialize c
    super :c=>c
  end
end


class Fahrenheit < Temperature
  def initialize f
    super :f=>f
  end
end

#################################