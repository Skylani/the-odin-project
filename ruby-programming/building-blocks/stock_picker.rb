def stock_picker price_array

  best_pair = [0,0]
  best_value = 0

  (0...price_array.length).each do |i|
    (i...price_array.length).each do |j|
      temp_value = price_array[j] - price_array[i]
      if temp_value > best_value
        best_pair = [i,j]
        best_value = temp_value
      end
    end
  end

  return best_pair

end