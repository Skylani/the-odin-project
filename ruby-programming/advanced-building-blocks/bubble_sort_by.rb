def bubble_sort_by array

  sorted = false

  loop do
    if !sorted
      # assume sorted for current loop
      sorted = true
      (0..array.length-2).each do |i|

        if yield(array[i], array[i+1]) > 0
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

print bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length }
puts