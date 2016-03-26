class RPNCalculator

  def initialize
    @stack = []
    @value = 0
  end

  def push num
    @stack.push num
  end

  def value
    @value
  end

  def error_check

    if (@num2 = @stack.pop) == nil
      raise 'calculator is empty'
    end
    if (@num1 = @stack.pop) == nil
      raise 'calculator is empty'
    end

  end

  def plus
    error_check
    @value = @num1 + @num2
    push @value
    @value
  end

  def minus
    error_check
    @value = @num1 - @num2
    push @value
    @value
  end

  def divide
    error_check
    @value = @num1 * 1.0 / @num2
    push @value
    @value
  end

  def times
    error_check
    @value = @num1 * @num2 * 1.0
    push @value
    @value
  end

  def tokens str
    str_array = str.split
    tokens = []

    str_array.each do |token|

      # digit
      if /\d/.match token
        tokens.push token.to_i
      # operation
      else
        tokens.push token.to_sym
      end

    end
    @tokens = tokens

  end

  def evaluate str
    tokens str
    result = evaluate_child
    @stack = []
    result
  end

  def evaluate_child
    parent = @tokens.pop
    if parent.is_a?(Symbol)
      # evaluate both side
      right = evaluate_child
      left = evaluate_child
      @stack.push left
      @stack.push right

      # calculate
      case parent
      when :+
        result = plus
      when :-
        result = minus
      when :*
        result = times
      else
        result = divide
      end

      # keep stack clean
      @stack = []
      result

    else
      # return result
      parent
    end

  end


end