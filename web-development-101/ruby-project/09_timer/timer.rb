class Timer
  def initialize
    @seconds = 0
  end

  def seconds
    @seconds
  end

  def seconds=(new_seconds)
    @seconds = new_seconds

    # set time_string
    if @seconds < 60
      @time_string = "00:00:#{two_digit_str(@seconds)}"
    else
      min = @seconds/60
      sec_str = two_digit_str(@seconds%60)
      if min < 60
        @time_string = "00:#{two_digit_str(min)}:#{sec_str}"
      else
        hr_str = two_digit_str(min/60)
        min_str = two_digit_str(min%60)
        @time_string = "#{hr_str}:#{min_str}:#{sec_str}"
      end
    end
  end

  # pad zero to make number two-digit
  def two_digit_str(num)
    if num < 10
      "0#{num}"
    else
      num.to_s
    end
  end

  def time_string
    @time_string
  end
end