def bubble_sort array

  sorted = false

  loop do
    if !sorted
      # assume sorted for current loop
      sorted = true
      (0..array.length-2).each do |i|

        if array[i] > array[i+1]
          temp = array[i]
          array[i] = array[i+1]
          array[i+1] = temp
          sorted = false # mark current loop !sorted
        end
      end
    else
      break

    end
  end
  array
end

print bubble_sort([4,3,78,2,0,2])
puts