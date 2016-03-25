class Dictionary
  def initialize
    @entries = {}

  end

  def entries
    @entries
  end

  def add pair
    if pair.is_a?(String)
      @entries[pair] = nil
    else
      @entries = @entries.merge(pair)
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    @entries.has_key?(key)
  end

  def find str
    result_hash = {}

    @entries.each do | key, value |
      if key.start_with?(str)
        result_hash = result_hash.merge(key=>value)
      end
    end
    result_hash
  end

  def printable
    output = ""
    keys = keywords

    for i in 0..keys.length-2
      output << "[#{keys[i]}] \"#{@entries[keys[i]]}\"\n"
    end

    # no newline for last entry
    output << "[#{keys[keys.length-1]}] \"#{@entries[keys[keys.length-1]]}\""

    output
  end
end